import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/views/widgets/main_dashboard/build_nav_bar_animated_container.dart';

class DesktopMenu extends StatelessWidget {
  const DesktopMenu({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('Portfolio'),
          const Spacer(),
          SizedBox(
            height: 30.0,
            child: ListView.separated(
              itemCount: menuItems.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, child) =>
                  Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => controller.scrollTo(index: index),
                  borderRadius: BorderRadius.circular(100.0),
                  onHover: (value) => controller.hoverFun(value, index),
                  child: BuildNavBarAnimatedContainer(
                      index: index,
                      hover: controller.menuIndex == index ? true : false),
                );
              },
            ),
          ),
          Constants.sizedBox(width: 30.0),
        ],
      ),
    );
  }
}
