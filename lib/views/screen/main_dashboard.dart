import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/class/handling_data_view.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/views/widgets/main_dashboard/cutom_scrollbar_widget.dart';
import 'package:my_portfolio/views/widgets/main_dashboard/desktop_menu.dart';
import 'package:my_portfolio/views/widgets/main_dashboard/mobile_menu.dart';

class MainDashBoard extends StatelessWidget {
  const MainDashBoard({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (controller) => HandlingDataViewScaffold(
        statusRequest: controller.statusRequest,
        child: Scaffold(
          backgroundColor: AppColor.bgColor,
          appBar: AppBar(
              backgroundColor: AppColor.bgColor,
              toolbarHeight: 90,
              titleSpacing: 40,
              elevation: 0,
              title: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 768) {
                  return const MbileMenu();
                } else {
                  return const DesktopMenu();
                }
              })),
          body: const CutomScrollbarWidget(),
        ),
      ),
    );
  }
}
