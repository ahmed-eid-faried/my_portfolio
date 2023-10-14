import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';

class BuildNavBarAnimatedContainer extends StatelessWidget {
  const BuildNavBarAnimatedContainer(
      {super.key, required this.index, required this.hover});
  final int index;
  final bool hover;
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (controller) => AnimatedContainer(
        alignment: Alignment.center,
        width: hover ? 80 : 75,
        duration: const Duration(milliseconds: 200),
        transform: hover ? controller.onMenuHover : null,
        child: Text(
          menuItems[index],
          style: AppTextStyles.headerTextStyle(
              color: hover ? AppColor.themeColor : AppColor.white),
        ),
      ),
    );
  }
}
