import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';
import 'package:my_portfolio/views/widgets/home_page/build_social_button.dart';

class CustomSocialButtons extends StatelessWidget {
  const CustomSocialButtons({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (dashcontroller) => FadeInUp(
        duration: const Duration(milliseconds: 1600),
        child: SizedBox(
          height: 48,
          child: ListView.separated(
            itemCount: socialButtons.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, child) =>
                Constants.sizedBox(width: 8.0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async => await dashcontroller.clickSocial(index),
                onHover: (value) => dashcontroller.fun(value, index),
                borderRadius: BorderRadius.circular(550.0),
                hoverColor: AppColor.themeColor,
                splashColor: AppColor.bgColor2,
                child: BuildSocialButton(
                    asset: socialButtons[index],
                    hover: dashcontroller.socialBI == index ? true : false),
              );
            },
          ),
        ),
      ),
    );
  }
}
