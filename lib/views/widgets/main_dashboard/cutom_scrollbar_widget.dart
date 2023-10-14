import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CutomScrollbarWidget extends StatelessWidget {
  const CutomScrollbarWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return 
    
    
    GetBuilder<MainDashBoardControllerImp>(
      builder: (controller) => ScrollablePositionedList.builder(
        itemCount: screensList.length,
        itemScrollController: controller.itemScrollController,
        itemPositionsListener: controller.itemPositionsListener,
        scrollOffsetListener: controller.scrollOffsetListener,
        itemBuilder: (context, index) {
          return screensList[index];
        },
      ),
    );


    
  }
}
