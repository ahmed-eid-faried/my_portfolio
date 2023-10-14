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
  List<SocialMedia>? socialMedia = [];
  List<ProjectsList>? projectsList = [];
  List<HomeDetials>? homeDetials = [];
  List<Services>? services = [];
  String cv = '';
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
