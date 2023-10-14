import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';

class MbileMenu extends StatelessWidget {
  const MbileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (controller) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('Portfolio'),
          const Spacer(),
          PopupMenuButton(
            icon: Icon(
              Icons.menu_sharp,
              size: 32,
              color: AppColor.white,
            ),
            color: AppColor.bgColor2,
            position: PopupMenuPosition.under,
            constraints: BoxConstraints.tightFor(width: Get.width * 0.9),
            itemBuilder: (BuildContext context) =>
                menuItems.asMap().entries.map((e) {
              return PopupMenuItem(
                textStyle: AppTextStyles.headerTextStyle(),
                onTap: () {
                  controller.scrollTo(index: e.key);
                },
                child: Text(e.value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
