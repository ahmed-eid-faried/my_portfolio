#!/usr/bin/env bash
set -euo pipefail

# Script: add-subdomain.sh
# Adds a subdomain record via Cloudflare API or Namecheap Dynamic DNS,
# plus configures Nginx reverse proxy.
# Usage examples:

#  sudo ./add-subdomain.sh api 8081
#  sudo ./add-subdomain.sh api       # will prompt for port
#  sudo ./add-subdomain.sh           # will prompt for both subdomain and port

# --- 1) Parse arguments ---
if [ $# -gt 2 ]; then
  echo "Usage: sudo $0 [subdomain] [port]"
  exit 1
fi

SUB="${1-}"
TARGET_PORT="${2-}"

# Prompt for missing values
if [ -z "$SUB" ]; then
  read -p "Enter subdomain (e.g., api): " SUB
fi
if [ -z "$TARGET_PORT" ]; then
  read -p "Enter target port (e.g., 8080): " TARGET_PORT
fi

DOMAIN="markazsoft.com"
FULL="${SUB}.${DOMAIN}"
TARGET_IP="109.205.178.122"
NAMECHEAP_DDNS_PASSWORD="4a9232fc129649ce9456c8e03081c439"

# --- 2) DNS provider selection ---
# Cloudflare: CF_ZONE_ID & CF_API_TOKEN
# Namecheap: NAMECHEAP_DDNS_PASSWORD & Dynamic DNS enabled on your domain
if [ -n "${CF_ZONE_ID-}" ] && [ -n "${CF_API_TOKEN-}" ]; then
  echo "🛠  Creating DNS record via Cloudflare for ${FULL} → ${TARGET_IP} …"
  curl -s -X POST "https://api.cloudflare.com/client/v4/zones/${CF_ZONE_ID}/dns_records" \
    -H "Authorization: Bearer ${CF_API_TOKEN}" \
    -H "Content-Type: application/json" \
    --data "{\"type\":\"A\",\"name\":\"${FULL}\",\"content\":\"${TARGET_IP}\",\"ttl\":120,\"proxied\":false}" \
    | jq .
elif [ -n "${NAMECHEAP_DDNS_PASSWORD-}" ]; then
  echo "🛠  Updating Namecheap Dynamic DNS for ${FULL} → ${TARGET_IP} …"
  curl -s "https://dynamicdns.park-your-domain.com/update?host=${SUB}&domain=${DOMAIN}&password=${NAMECHEAP_DDNS_PASSWORD}&ip=${TARGET_IP}" 
  echo
else
  echo "Error: No DNS credentials found.\nSet CF_ZONE_ID & CF_API_TOKEN for Cloudflare, or NAMECHEAP_DDNS_PASSWORD for Namecheap."
  exit 1
fi

# --- 3) Nginx reverse proxy setup ---
NGINX_AVAIL="/etc/nginx/sites-available/${FULL}"
NGINX_ENABLE="/etc/nginx/sites-enabled/${FULL}"

echo "🛠  Generating Nginx config for ${FULL} → localhost:${TARGET_PORT} …"
sudo tee "${NGINX_AVAIL}" > /dev/null <<EOF
server {
    listen 80;
    server_name ${FULL};

    location / {
        proxy_pass http://localhost:${TARGET_PORT};
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

# Enable site
if [ ! -e "${NGINX_ENABLE}" ]; then
  sudo ln -s "${NGINX_AVAIL}" "${NGINX_ENABLE}"
fi

echo "🔍 Testing Nginx configuration…"
sudo nginx -t

echo "♻️ Reloading Nginx…"
sudo systemctl reload nginx

# --- 4) HTTPS reminder ---
echo
echo "🔒 To enable HTTPS for ${FULL}, run:"
echo "sudo certbot --nginx -d ${FULL} -d www.${FULL}"
echo

echo "✅ Completed: http://${FULL}/ is now configured (proxy to port ${TARGET_PORT})"
