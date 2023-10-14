import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/class/app_buttons.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';
import 'package:my_portfolio/views/widgets/home_page/custom_job_widgets.dart';
import 'package:my_portfolio/views/widgets/home_page/custom_social_buttons.dart';

class BuildHomePersonalInfo extends StatelessWidget {
  const BuildHomePersonalInfo({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (dashcontroller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              'Hello, It\'s Me',
              style: AppTextStyles.montserratStyle(color: Colors.white),
            ),
          ),
          Constants.sizedBox(height: 15.0),
          FittedBox(
            child: FadeInRight(
              duration: const Duration(milliseconds: 1400),
              child: Text(
                dashcontroller.homeDetials![0].hdName ?? '',
                style: AppTextStyles.headingStyles(),
              ),
            ),
          ),
          Constants.sizedBox(height: 15.0),
          const CustomJobWidgets(),
          Constants.sizedBox(height: 15.0),
          FadeInDown(
            duration: const Duration(milliseconds: 1600),
            child: Text(
              dashcontroller.homeDetials![0].hdDesc ?? '',
              style: AppTextStyles.normalStyle(),
            ),
          ),
          Constants.sizedBox(height: 22.0),
          const CustomSocialButtons(),
          Constants.sizedBox(height: 18.0),
          FadeInUp(
            duration: const Duration(milliseconds: 1800),
            child: AppButtons.buildMaterialButton(
                onTap: () => dashcontroller
                    .link(dashcontroller.homeDetials![0].hdCv ?? ''),
                buttonName: 'Download CV'),
          ),
          Constants.sizedBox(height: 18.0),
          FadeInUp(
            duration: const Duration(milliseconds: 1800),
            child: AppButtons.buildMaterialButton(
                onTap: () async => await dashcontroller.scrollTo(
                    index: screensList.length - 1),
                buttonName: 'Hire Me'),
          ),
        ],
      ),
    );
  }
}
