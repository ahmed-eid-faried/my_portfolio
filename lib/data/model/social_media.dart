class SocialMedia {
  String? smId;
  String? smFacebook;
  String? smWhatsapp;
  String? smGithub;
  String? smLinkedin;
  String? smEmail;
  String? smTwitter;
  String? smCv;
  String? smInstagram;

  SocialMedia(
      {this.smId,
      this.smFacebook,
      this.smWhatsapp,
      this.smGithub,
      this.smLinkedin,
      this.smEmail,
      this.smTwitter,
      this.smCv,
      this.smInstagram});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    smId = json['sm_id'];
    smFacebook = json['sm_facebook'];
    smWhatsapp = json['sm_whatsapp'];
    smGithub = json['sm_github'];
    smLinkedin = json['sm_linkedin'];
    smEmail = json['sm_email'];
    smTwitter = json['sm_twitter'];
    smCv = json['sm_cv'];
    smInstagram = json['sm_instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sm_id'] = smId;
    data['sm_facebook'] = smFacebook;
    data['sm_whatsapp'] = smWhatsapp;
    data['sm_github'] = smGithub;
    data['sm_linkedin'] = smLinkedin;
    data['sm_email'] = smEmail;
    data['sm_twitter'] = smTwitter;
    data['sm_cv'] = smCv;
    data['sm_instagram'] = smInstagram;
    return data;
  }
}
