import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
 
class BuildMyServicesText extends StatelessWidget {
  const BuildMyServicesText({super.key});
  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColor .robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }
}
