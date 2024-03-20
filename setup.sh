#!/bin/bash
# add this to path of flutter project and run this to setup
# sudo chmod +x setup.sh
# ./setup.sh
###################################rename#######################################
# Rename Flutter app (change name and bundle identifier)
flutter pub global activate rename
flutter pub global run rename --bundleId com.example.newbundleid --appname "NewAppName"
################################################################################
########################launcher_icons##################################
# Install Flutter Launcher Icons package
flutter pub global activate launcher_icons
################################################################################
# # Add dev dependency to pubspec.yaml for launcher_icons
# echo -e "\ndev_dependencies:\n  launcher_icons: '^0.13.1'" >> pubspec.yaml
# # Add Flutter Launcher Icons configuration to pubspec.yaml
# echo -e "\nlauncher_icons:" >> pubspec.yaml
# echo -e "  android: \"launcher_icon\"" >> pubspec.yaml
# echo -e "  ios: true" >> pubspec.yaml
# echo -e "  image_path: \"assets/icon/icon.png\"" >> pubspec.yaml
# echo -e "  min_sdk_android: 21" >> pubspec.yaml
# echo -e "  web:" >> pubspec.yaml
# echo -e "    generate: true" >> pubspec.yaml
# echo -e "    image_path: \"path/to/image.png\"" >> pubspec.yaml
# echo -e "    background_color: \"#hexcode\"" >> pubspec.yaml
# echo -e "    theme_color: \"#hexcode\"" >> pubspec.yaml
# echo -e "  windows:" >> pubspec.yaml
# echo -e "    generate: true" >> pubspec.yaml
# echo -e "    image_path: \"path/to/image.png\"" >> pubspec.yaml
# echo -e "    icon_size: 48" >> pubspec.yaml
# echo -e "  macos:" >> pubspec.yaml
# echo -e "    generate: true" >> pubspec.yaml
# echo -e "    image_path: \"path/to/image.png\"" >> pubspec.yaml
################################################################################
# Configure Flutter Launcher Icons
flutter pub global run launcher_icons:main
################################################################################
###########################flutter_native_splash################################
# # Add Flutter Native Splash configuration to pubspec.yaml
# echo -e "\nflutter_native_splash:" >> pubspec.yaml
# echo -e "  color: \"#ffffff\"" >> pubspec.yaml
# echo -e "  image: assets/logo-development.png" >> pubspec.yaml
# echo -e "  branding: assets/branding-development.png" >> pubspec.yaml
# echo -e "  color_dark: \"#121212\"" >> pubspec.yaml
# echo -e "  image_dark: assets/logo-development.png" >> pubspec.yaml
# echo -e "  branding_dark: assets/branding-development.png" >> pubspec.yaml
# echo -e "  android_12:" >> pubspec.yaml
# echo -e "    image: assets/logo-development.png" >> pubspec.yaml
# echo -e "    icon_background_color: \"#ffffff\"" >> pubspec.yaml
# echo -e "    image_dark: assets/logo-development.png" >> pubspec.yaml
# echo -e "    icon_background_color_dark: \"#121212\"" >> pubspec.yaml
# echo -e "  web: false" >> pubspec.yaml
################################################################################
# Configure splash screen (if applicable)
# Example command to configure splash screen using flutter_native_splash package
# Replace the values according to your project
flutter pub global activate flutter_native_splash
flutter pub global run flutter_native_splash:create
################################################################################
################################################################################
# Run flutter packages get to ensure all dependencies are up to date
flutter packages get
################################################################################
################################################################################
# Optionally, you may want to clean up generated files after the build
# rm -rf build/
# rm -rf ios/Pods/
# rm -rf ios/.symlinks/
# rm -rf ios/Flutter/
# rm -rf android/.gradle/
# rm -rf android/app/build/
################################################################################
echo "Setup completed."
################################################################################
################################################################################
