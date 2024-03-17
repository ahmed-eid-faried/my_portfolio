import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/class/status_request.dart';
import 'package:my_portfolio/core/function/handling_data.dart';
import 'package:my_portfolio/core/services/services.dart';
import 'package:my_portfolio/data/datasource/remote/home.dart';
import 'package:my_portfolio/data/model/home_detials.dart';
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

class AppCV {
  List<SocialMedia>? socialMedia = [
    SocialMedia(
      smCv:
          "https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view?usp=sharing",
      smGithub: "https://github.com/ahmed-eid-faried",
      smEmail: "ahmed.eid.ac.1.edu@gmail.com",
      smId: "0",
      smWhatsapp: "01555663045",
      smLinkedin: "https://www.linkedin.com/in/ahmed-mady-a16715228/",
      smFacebook: "https://www.facebook.com/ahmedeed.eed.7/",
      // smTwitter: ,
      // smInstagram: ,
    )
  ];
  List<ProjectsList>? projectsList = [
    ProjectsList(
      plId: "0",
      plTitle: "PORTFOLIO",
      plBody:
          '''A Portfolio Flutter app is a mobile application designed to showcase your professional works and projects. It serves as a digital
      portfolio or resume, allowing you to display your skills, accomplishments, and previous projects to potential employers, clients, or anyone
      interested in your work.''',
      plImage: "assets/images/portfolio.png",
      plGoogleplay:
          "https://play.google.com/store/apps/details?id=com.amadytech.amadytech",
      plAppstore: "",
      plGithub: "https://github.com/ahmed-eid-faried/my_portfolio",
      plDoc: "https://www.youtube.com/watch?v=ovRCTtGSyV8",
      plWeb: "https://github.com/ahmed-eid-faried/ahmed-eid-faried.github.io",
    ),
  ];
  List<HomeDetials>? homeDetials = [
    HomeDetials(
      hdId: "0",
      hdName: "Ahmed Mady",
      hdAboutimage: "assets/images/about_image.png",
      hdAboutmedesc: '''
      Experienced Flutter Developer skilled in Dart, OOP, and Solid Principles, proficient in problem-solving and data structures. Demonstrated
expertise in Flutter, including animations, notifications, and deployment, coupled with strong proficiency in handling RESTful APIs, JSON,
Postman, and Thunder Client, along with MySQL and PHP for API integration. Well-versed in state management techniques, including Getx,
Provider, and Bloc pattern, with a solid grasp of design patterns, such as MVC, and a commitment to clean code and clean architecture.
Proficient in Firebase services, debugging, various testing methodologies, Git, GitHub, UI/UX tools like Adobe XD and Figma, and adept in
communication in English. Experienced in CI/CD, Agile development methodologies, and working with Jira for efficient project management.
      ''',
      hdAboutmename: "About Me",
      hdCv:
          "https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view",
      hdDesc:
          '''Passionate Flutter developer with expertise in Dart and Flutter, dedicated to creating high-quality, user-centric mobile apps. Committed to
      delivering innovative solutions that enhance user experiences and drive business success.''',
      hdImage: "assets/images/image.png",
    )
  ];
  List<Services>? services = [
    Services(
      servicesId: "0",
      servicesTitle: "Android",
      servicesBody: "mmmmmm",
      servicesAssets: "",
      servicesType: "",
    )
  ];
  static String cv =
      'https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view?usp=sharing';
  static List<String?> socialLink = [];
  static List<String?> foooterLink = [];
}

class MainDashBoardControllerImp extends MainDashBoardController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final onMenuHover = Matrix4.identity()..scale(1.0);
  var menuIndex = 0;
  static late MyPortfolioModel myPortfolio;

  // final box = GetStorage();
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  MyService myServices = Get.find();
  List<SocialMedia>? socialMedia = [
    SocialMedia(
      smCv:
          "https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view?usp=sharing",
      smGithub: "https://github.com/ahmed-eid-faried",
      smEmail: "ahmed.eid.ac.1.edu@gmail.com",
      smId: "0",
      smWhatsapp: "01555663045",
      smLinkedin: "https://www.linkedin.com/in/ahmed-mady-a16715228/",
      smFacebook: "https://www.facebook.com/ahmedeed.eed.7/",
      // smTwitter: ,
      // smInstagram: ,
    )
  ];
  List<ProjectsList>? projectsList = [
    ProjectsList(
      plId: "",
      plTitle: "",
      plBody: "",
      plImage: "",
      plGoogleplay: "",
      plAppstore: "",
      plGithub: "",
      plDoc: "",
      plWeb: "",
    ),
  ];
  List<HomeDetials>? homeDetials = [
    HomeDetials(
      hdName: "",
      hdAboutimage: "",
      hdAboutmedesc: "",
      hdAboutmename: "",
      hdCv: "",
      hdDesc: "",
      hdId: "",
      hdImage: "",
    )
  ];
  List<Services>? services = [
    Services(
      servicesAssets: "",
      servicesBody: "",
      servicesId: "",
      servicesTitle: "",
      servicesType: "",
    )
  ];
  String cv =
      'https://drive.google.com/file/d/1q5Vg44gRgH9Er4mCN5lYJRlVpURrBIdY/view?usp=sharing';
  List<String?> socialLink = [];
  List<String?> foooterLink = [];
  var socialBI;

  @override
  Future<void> intialData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    // print("statusRequest:-$statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        updateAllData(response);
        // print("=========================================================");
        // print("response:-$response");
        // print("=========================================================");

        // box.write('MyPortfolioModel', response);
      } else {
        statusRequest = StatusRequest.failure;
      }
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
        .map((item) => ProjectsList.fromJson(item))
        .toList();
    print("=========================================================");
    print("projectsList[0]:-${projectsList!.length}");
    print("=========================================================");
    update();
    homeDetials = (response['home_detials'] as List)
        .map((item) => HomeDetials.fromJson(item))
        .toList();
    services = (response['services'] as List)
        .map((item) => Services.fromJson(item))
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
    if (socialMedia![0] != null) {
      var socialLinkIntialData = socialMedia![0];
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
