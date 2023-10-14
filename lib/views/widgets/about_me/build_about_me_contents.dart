import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/about_me_controller.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/class/app_buttons.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';

class BuildAboutMeContents extends StatelessWidget {
  const BuildAboutMeContents({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    Get.put(AboutMeController());
    return GetBuilder<AboutMeController>(
      builder: (aboutMecontroller) => GetBuilder<MainDashBoardControllerImp>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeInRight(
              duration: const Duration(milliseconds: 1200),
              child: RichText(
                text: TextSpan(
                  text: 'About ',
                  style: AppTextStyles.headingStyles(fontSize: 30.0),
                  children: [
                    TextSpan(
                      text: 'Me!',
                      style: AppTextStyles.headingStyles(
                          fontSize: 30, color: AppColor.robinEdgeBlue),
                    )
                  ],
                ),
              ),
            ),
            Constants.sizedBox(height: 6.0),
            FadeInLeft(
              duration: const Duration(milliseconds: 1400),
              child: Text(
                controller.homeDetials![0].hdAboutmename!,
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
            ),
            Constants.sizedBox(height: 8.0),
            FadeInLeft(
              duration: const Duration(milliseconds: 1600),
              child: Text(
                controller.homeDetials![0].hdAboutmedesc!,
                maxLines: aboutMecontroller.readMore == true ? 5000 : 8,
                style: AppTextStyles.normalStyle(),
              ),
            ),
            Constants.sizedBox(height: 15.0),
            FadeInUp(
              duration: const Duration(milliseconds: 1800),
              child: AppButtons.buildMaterialButton(
                onTap: () => aboutMecontroller.readMoreFun(),
                buttonName: aboutMecontroller.readMore == true
                    ? 'Read Less'
                    : 'Read More',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
