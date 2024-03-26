import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/class/status_request.dart';
import 'package:my_portfolio/core/function/handling_data.dart';
import 'package:my_portfolio/core/services/services.dart';
import 'package:my_portfolio/data/datasource/remote/home.dart';
import 'package:my_portfolio/data/model/home_details.dart';
import 'package:my_portfolio/data/model/my_portfolio_model.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/data/model/services.dart';
import 'package:my_portfolio/data/model/social_media.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class MainDashBoardController extends GetxController {
  Future<void> intialData();
  Future<void> scrollTo({required int index});
  hoverFun(bool value, int index);
  Future<void> funServices(String ontapText);
  updateAllData(response);
  Future<void> clickSocial(int index);
  Future<void> intialData2();
  Future<void> clickFooter(int index);
  fun(bool value, int index);
  Future<void> link(String url);
}

class MainDashBoardControllerImp extends MainDashBoardController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  var menuIndex = 0;
  static late Data myPortfolio;
  // final box = GetStorage();
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  List<SocialMedia>? socialMedia = [];
  List<Project>? projectsList = [];
  List<HomeDetials>? homeDetials = [];
  List<Service>? services = [];
  String cv = '';
  List<String?> socialLink = [];
  List<String?> foooterLink = [];
  int? socialBI;

  @override
  Future<void> intialData() async {
    try {
      statusRequest = StatusRequest.loading;
      update();
      var response = await homeData.getData();
      statusRequest = handlingData(response);
      debugPrint("statusRequest:-$statusRequest");
      updateAllData(response);
      debugPrint("=========================================================");
      debugPrint("response:-$response");
      debugPrint("=========================================================");
    } catch (e) {
      print(e);
      updateAllData(errorResponse);
      debugPrint("=========================================================");
      debugPrint("errorResponse:-$errorResponse");
      debugPrint("=========================================================");
      statusRequest = StatusRequest.success;
    }

    update();
  }

  @override
  Future<void> scrollTo({required int index}) async {
    itemScrollController
        .scrollTo(
      index: index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn,
    )
        .whenComplete(() {
      menuIndex = index;
    });
    update();
  }

  @override
  hoverFun(bool value, int index) {
    if (value) {
      menuIndex = index;
    } else {
      menuIndex = 0;
    }
  }

  @override
  Future<void> funServices(String ontapText) async {
    await scrollTo(index: 0);
  }

  @override
  updateAllData(response) {
    socialMedia = (response['social_media'] as List)
        .map((item) => SocialMedia.fromJson(item))
        .toList();
    projectsList = (response['projects_list'] as List)
        .map((item) => Project.fromJson(item))
        .toList();
    debugPrint("=========================================================");
    debugPrint("projectsList.first:-${projectsList!.length}");
    debugPrint("=========================================================");
    debugPrint("=========================================================");
    debugPrint("social_media:-${response['social_media']}");
    debugPrint("=========================================================");
    debugPrint("=========================================================");
    debugPrint("projects_list:-${response['projects_list']}");
    debugPrint("=========================================================");
    debugPrint("=========================================================");
    debugPrint("home_detials:-${response['home_detials']}");
    debugPrint("=========================================================");
    debugPrint("=========================================================");
    debugPrint("services:-${response['services']}");
    debugPrint("=========================================================");
    update();
    homeDetials = (response['home_detials'] as List)
        .map((item) => HomeDetials.fromJson(item))
        .toList();
    services = (response['services'] as List)
        .map((item) => Service.fromJson(item))
        .toList();
  }

  @override
  Future<void> clickSocial(int index, {bool footer = false}) async {
    String url = footer ? foooterLink[index]! : socialLink[index]!;
    // ignore: unnecessary_null_comparison
    if (url != null && url != '') {
      final Uri url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
      }
    }
  }

  @override
  Future<void> clickFooter(int index) async {
    String url = foooterLink[index]!;
    // ignore: unnecessary_null_comparison
    if (url != null && url != '') {
      final Uri url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
      }
    }
  }

  @override
  intialData2() async {
    // ignore: unnecessary_null_comparison
    if (socialMedia!.isNotEmpty) {
      var socialLinkIntialData = socialMedia!.first;
      socialLink = [
        socialLinkIntialData.smFacebook,
        // socialLinkIntialData.smTwitter,
        socialLinkIntialData.smLinkedin,
        // socialLinkIntialData.smInstagram,
        socialLinkIntialData.smGithub,
        socialLinkIntialData.smWhatsapp,
        socialLinkIntialData.smEmail,
      ];
      foooterLink = [
        socialLinkIntialData.smLinkedin,
        socialLinkIntialData.smGithub,
        socialLinkIntialData.smWhatsapp,
        socialLinkIntialData.smEmail,
      ];
      cv = socialLinkIntialData.smCv!;
    }

    update();
  }

  @override
  void onInit() async {
    await intialData();
    await intialData2();
    super.onInit();
  }

  @override
  fun(bool value, int index) {
    if (value) {
      socialBI = index;
    } else {
      socialBI = null;
    }
    update();
  }

  @override
  Future<void> link(String url) async {
    // ignore: unnecessary_null_comparison
    if (url != null && url != '') {
      final Uri url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
      }
    }
  }
}

var errorResponse = {
  "social_media": [
    {
      "sm_id": "65f991583e6238e9612108b1",
      "sm_facebook": "https://www.facebook.com/ahmedeed.eed.7",
      "sm_whatsapp": "https://wa.me/+201555663045?text=from%20my%20website",
      "sm_github": "https://github.com/ahmed-eid-faried",
      "sm_linkedin": "https://www.linkedin.com/in/ahmed-mady-a16715228/",
      "sm_email":
          "https://mail.google.com/mail/u/0/?fs=1&to=ahmed.eid.ac.1.edu@gmail.com&su=FromWebsite&tf=cm",
      "sm_twitter": "https://twitter.com/AHMEDMA65756172/",
      "sm_cv":
          "https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view?usp=sharing",
      "sm_instagram": "https://www.instagram.com/ahmed_eid_ac/",
      "sm_medium": "https://medium.com/@ahmed.eid.ac.1.edu"
    }
  ],
  "projects_list": [
    {
      "pl_id": "65f991573e6238e9612108a9",
      "pl_title": "PORTFOLIO",
      "pl_body":
          "A Flutter app designed to showcase professional works and projects, serving as a digital portfolio or resume.",
      "pl_image": "https://i.ibb.co/XYh50Sq/amadytech.png",
      "pl_googleplay":
          "https://play.google.com/store/apps/details?id=com.amadytech.amadytech",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/my_portfolio",
      "pl_doc": "https://www.youtube.com/watch?v=ovRCTtGSyV8",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108aa",
      "pl_title": "Happy Shop",
      "pl_body":
          "The 'Happy Shop' app offers a fun and easy online shopping experience with features like product search, category browsing, top-sellers, offers, and favorites. Users can receive notifications, track orders, and contact customer service through the app. Developed to enhance user convenience, the Happy Shop app aims to provide an enjoyable shopping experience tailored to users' needs.",
      "pl_image": "https://i.ibb.co/7n0g8tb/happyshop.png",
      "pl_googleplay":
          "https://play.google.com/store/apps/details?id=com.amadytech.happyshop",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/happyshop",
      "pl_doc": "https://www.youtube.com/watch?v=RuvCCDwtgtQ&feature=youtu.be",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108ae",
      "pl_title": "Delivery",
      "pl_body":
          "Enhance your online shopping experience with our all-in-one Delivery App. Easily manage pending, accepted, and archived orders, receive real-time notifications, contact us via SMS, email, or WhatsApp, track orders on an interactive map with live location, and enjoy smooth animations and reliable Crashlytics integration.",
      "pl_image": "https://i.ibb.co/bzDWGLx/delivery.png",
      "pl_googleplay":
          "https://play.google.com/store/apps/details?id=com.amadytech.delivery",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/delivery",
      "pl_doc": "https://www.youtube.com/watch?v=tg2oO5aPWwI",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108ac",
      "pl_title": "Islamic songs App",
      "pl_body":
          "The Islamic Songs Application is a distinctive app that offers a collection of high-quality and diverse religious songs. Users can listen to a variety of Islamic songs aimed at enhancing spirituality and contemplation.",
      "pl_image": "https://i.ibb.co/Q9BhgFr/islamicsongs.png",
      "pl_googleplay":
          "https://play.google.com/store/apps/details?id=com.amadytech.islamic_songs",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/islamic_songs_app",
      "pl_doc": "https://www.youtube.com/watch?v=rgzgK5Q07lY",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108b0",
      "pl_title": "News App",
      "pl_body":
          "The News App is a distinctive application available on the Google Play Store that allows you to stay constantly updated with the\tlatest news and developments from reliable sources. This app provides you with quick and easy access to the latest local.",
      "pl_image": "https://i.ibb.co/MCQzjSv/news.png",
      "pl_googleplay":
          "https://drive.google.com/file/d/1JPDMkw3IuEaevIar0Ag30eDtXC-2sX_o/view?usp=sharing",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/news-app",
      "pl_doc": "https://www.youtube.com/watch?v=Nj2HyHwXijg",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108af",
      "pl_title": "Weather",
      "pl_body":
          "The Weather App is a useful and essential application available on the Google Play Store that helps you track and know the weather conditions in your area and anywhere else in the world. You can rely on this app to get accurate weather forecasts.",
      "pl_image":
          "https://lh3.googleusercontent.com/L7bMl39gJi3w-q9tDi8XGTjRXIppEr5oZprMPt6flxnoxIDj9QQYRQtn3HKF5_hTL1Y",
      "pl_googleplay":
          "https://drive.google.com/file/d/1M4ynp3lQs0LIFym2fJt5OwZfKIlagTi1/view?usp=sharing",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/weather",
      "pl_doc": "https://www.youtube.com/watch?v=4jHMKkqxFQw",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108ad",
      "pl_title": "MY TASKS",
      "pl_body":
          "My Tasks is your go-to daily task management app. It's designed to help you stay organized, focused, and in control of your daily activities. With a user-friendly interface and a sleek design, managing your tasks has never been easier.",
      "pl_image": "https://i.ibb.co/RHkT9d3/mytasks.png",
      "pl_googleplay":
          "https://play.google.com/store/apps/details?id=com.amadytech.mytasks",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/mytasks",
      "pl_doc": "https://www.youtube.com/watch?v=qkkB0egPwqU",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    },
    {
      "pl_id": "65f991573e6238e9612108ab",
      "pl_title": "Shafi'I Poems",
      "pl_body":
          "The 'Imam Shafi'i Poems' application is a great source for exploring and reading the profound religious poems of Imam Shafi'i.",
      "pl_image": "https://i.ibb.co/bH5RwYb/shafii.png",
      "pl_googleplay":
          "https://play.google.com/store/apps/details?id=com.amadytech.shafii",
      "pl_appstore": "",
      "pl_github": "https://github.com/ahmed-eid-faried/shafii",
      "pl_doc": "https://www.youtube.com/watch?v=dQrDuOSBGrA",
      "pl_package": "",
      "pl_cli": "",
      "pl_embedded": "",
      "pl_linux": "",
      "pl_windows": "",
      "pl_macos": "",
      "pl_web": ""
    }
  ],
  "home_detials": [
    {
      "hd_id": "65f991573e6238e9612108a8",
      "hd_name": "I am a software engineer.",
      "hd_desc":
          "Passionate Flutter developer with expertise in Dart and Flutter, dedicated to creating high-quality, user-centric mobile apps. Committed to delivering innovative solutions that enhance user experiences and drive business success.",
      "hd_image": "https://i.ibb.co/xDf7cvq/profile-pic-61.png",
      "hd_cv":
          "https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view?usp=sharing",
      "hd_aboutmename": "Flutter Developer",
      "hd_aboutmedesc":
          "Experienced Flutter Developer skilled in Dart, OOP, and Solid Principles, proficient in problem-solving and data structures. Demonstrated expertise in Flutter, including animations, notifications, and deployment, coupled with strong proficiency in handling RESTful APIs, JSON, Postman, and Thunder Client, along with MySQL and PHP for API integration. Well-versed in state management techniques, including Getx, Provider, and Bloc pattern, with a solid grasp of design patterns, such as MVC, and a commitment to clean code and clean architecture. Proficient in Firebase services, debugging, various testing methodologies, Git, GitHub, UI/UX tools like Adobe XD and Figma, and adept in communication in English. Experienced in CI/CD, Agile development methodologies, and working with Jira for efficient project management.",
      "hd_aboutimage": "https://i.ibb.co/rG5Gm9n/profile-pic-55.png"
    }
  ],
  "services": [
    {
      "services_id": "65f991583e6238e9612108b2",
      "services_title": "Web Development",
      "services_body":
          "We specialize in building responsive and user-friendly websites using React or Flutter.",
      "services_assets": "https://i.ibb.co/CVndDjn/web.png",
      "services_type": "Web Development"
    },
    {
      "services_id": "65f991583e6238e9612108bb",
      "services_title": "Embedded Systems Development",
      "services_body":
          "We design and develop embedded systems solutions using Golang or Flutter.",
      "services_assets": "https://i.ibb.co/68rq4gN/icons8-embedded-66-1.png",
      "services_type": "Embedded Systems Development"
    },
    {
      "services_id": "65f991583e6238e9612108b3",
      "services_title": "Mobile App Development (Android)",
      "services_body":
          "We develop native Android applications using Flutter or Golang.",
      "services_assets": "https://i.ibb.co/j4H29rK/icons8-google-play-100.png",
      "services_type": "Mobile Development"
    },
    {
      "services_id": "65f991583e6238e9612108ba",
      "services_title": "Package Tool Development",
      "services_body":
          "We develop custom package tools to streamline your development process.",
      "services_assets": "https://i.ibb.co/crrsbgg/share.png",
      "services_type": "Package Tool Development"
    },
    {
      "services_id": "65f991583e6238e9612108b9",
      "services_title": "Backend Development",
      "services_body":
          "We create robust and scalable backend solutions using Golang.",
      "services_assets": "https://i.ibb.co/NYmR5Hf/icons8-backend-64.png",
      "services_type": "Backend Development"
    },
    {
      "services_id": "65f991583e6238e9612108b6",
      "services_title": "Desktop App Development (Windows)",
      "services_body":
          "We build desktop applications for Windows using Flutter or other technologies.",
      "services_assets": "https://i.ibb.co/BZScnXb/icons8-windows-10-100.png",
      "services_type": "Desktop Development"
    },
    {
      "services_id": "65f991583e6238e9612108b7",
      "services_title": "Desktop App Development (Mac OS)",
      "services_body":
          "We build desktop applications for Mac OS using Flutter or other technologies.",
      "services_assets": "https://i.ibb.co/nzmQ4FL/icons8-mac-client-64.png",
      "services_type": "Desktop Development"
    },
    {
      "services_id": "65f991583e6238e9612108b4",
      "services_title": "Mobile App Development (iOS)",
      "services_body":
          "We develop native iOS applications using Flutter and Golang.",
      "services_assets": "https://i.ibb.co/JCstCQH/appstore.png",
      "services_type": "Mobile Development"
    },
    {
      "services_id": "65f991583e6238e9612108b8",
      "services_title": "Desktop App Development (Linux)",
      "services_body":
          "We build desktop applications for Linux using Flutter or other technologies.",
      "services_assets":
          "https://i.ibb.co/Q6GbLsw/icons8-linux-server-100-1.png",
      "services_type": "Desktop Development"
    },
    {
      "services_id": "65f991583e6238e9612108bc",
      "services_title": "CLI (Command-Line Interface) Development",
      "services_body":
          "We build command-line interfaces using Golang for various purposes.",
      "services_assets": "https://i.ibb.co/Q8m1H46/coding.png",
      "services_type": "CLI Development"
    },
    {
      "services_id": "65f991583e6238e9612108b5",
      "services_title": "Cross-Platform App Development",
      "services_body":
          "We create cross-platform apps using Flutter and Golang.",
      "services_assets":
          "https://i.ibb.co/7tD4hdX/icons8-multiple-devices-100.png",
      "services_type": "Cross-Platform Development"
    }
  ]
};
