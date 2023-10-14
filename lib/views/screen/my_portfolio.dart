import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/class/helper_class.dart';
import 'package:my_portfolio/views/widgets/myportfolio/build_project_grid_view.dart';
import 'package:my_portfolio/views/widgets/myportfolio/project_text.dart';
 import '../../core/class/constants.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HelperClass(
      mobile: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProjectText(),
          Constants.sizedBox(height: 40.0),
          const BuildProjectGridView(crossAxisCount: 1)
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProjectText(),
          Constants.sizedBox(height: 40.0),
          const BuildProjectGridView(crossAxisCount: 2)
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ProjectText(),
          Constants.sizedBox(height: 40.0),
          const BuildProjectGridView(crossAxisCount: 3),
        ],
      ),
      paddingWidth: Get.width * 0.1,
      bgColor: AppColor .bgColor2,
    );
  }
}
