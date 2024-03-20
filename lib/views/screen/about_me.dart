import 'package:flutter/material.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/class/helper_class.dart';
import 'package:my_portfolio/views/widgets/about_me/build_about_me_contents.dart';
import 'package:my_portfolio/views/widgets/about_me/build_profile_picture.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          const BuildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          const BuildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BuildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          const Expanded(child: BuildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BuildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          const Expanded(child: BuildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColor.bgColor2,
    );
  }
}
