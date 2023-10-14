import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/applink.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:image_network/image_network.dart';

class BuildProfilePicture extends StatelessWidget {
  const BuildProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: GetBuilder<MainDashBoardControllerImp>(
          builder: (dashcontroller) => ImageNetwork(
                image:
                    "${AppLink.imagePL}/${dashcontroller.homeDetials![0].hdAboutimage}",
                width: Adaptive.px(350),
                height: Adaptive.px(350),
                duration: 1500,
                curve: Curves.easeIn,
                onPointer: true,
                fitWeb: BoxFitWeb.fill,
                fitAndroidIos: BoxFit.fill,
                onLoading: Container(),
                onError: Icon(Icons.error, color: AppColor.themeColor),
              )),
    );
  }
}
