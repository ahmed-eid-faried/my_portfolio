import 'package:flutter/material.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/class/helper_class.dart';
import 'package:my_portfolio/views/widgets/home_page/build_home_personal_info.dart';
import 'package:my_portfolio/views/widgets/profile_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          const BuildHomePersonalInfo(),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      tablet: Column(
        children: [
          const BuildHomePersonalInfo(),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      desktop: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: BuildHomePersonalInfo()),
          ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }
}
