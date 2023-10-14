import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/applink.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileAnimation extends StatelessWidget {
  const ProfileAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileAnimationController());
    return GetBuilder<ProfileAnimationController>(
      init: ProfileAnimationController(),
      builder: (controller) => GetBuilder<MainDashBoardControllerImp>(
        builder: (dashcontroller) => SlideTransition(
          position: controller.animation,
          child: ImageNetwork(
            image:
                "${AppLink.imagePL}/${dashcontroller.homeDetials![0].hdImage}",
            width: Adaptive.px(350),
            height: Adaptive.px(350),
            duration: 1500,
            curve: Curves.easeIn,
            onPointer: true,
            fitWeb: BoxFitWeb.fill,
            fitAndroidIos: BoxFit.fill,
            onLoading: Container(),
            onError: Icon(Icons.error, color: AppColor.themeColor),
          ),
        ),
      ),
    );
  }
}

class ProfileAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController controller;
  late Animation<Offset> animation;

  @override
  void onInit() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    animation = Tween(begin: const Offset(0, 0.1), end: const Offset(0, 0))
        .animate(controller);
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
