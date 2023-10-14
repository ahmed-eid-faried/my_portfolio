import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';

class CustomJobWidgets extends StatelessWidget {
  const CustomJobWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());

    return FittedBox(
      child: FadeInLeft(
        duration: const Duration(milliseconds: 1400),
        child: Row(
          children: [
            Text(
              'And I\'m a ',
              style: AppTextStyles.montserratStyle(color: Colors.white),
            ),
            GetBuilder<MainDashBoardControllerImp>(
              builder: (controller) => AnimatedTextKit(
                animatedTexts: [
                  ...List.generate(
                      mySkills.length,
                      (index) => TyperAnimatedText(mySkills[index],
                          textStyle: AppTextStyles.montserratStyle(
                              color: Colors.lightBlue)))
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
