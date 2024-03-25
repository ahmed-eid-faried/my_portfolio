import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/controller/my_portfolio_controller.dart';
import 'package:my_portfolio/views/widgets/myportfolio/custom_project_detials.dart';

class BuildProjectGridView extends StatelessWidget {
  const BuildProjectGridView({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    Get.put(MyPortfolioController());
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (dashcontroller) => GetBuilder<MyPortfolioController>(
        builder: (controller) => GridView.builder(
          itemCount: dashcontroller.projectsList!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisExtent: 300,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
          ),
          itemBuilder: (context, index) {
            return CustomProjectDetials(index: index);
          },
        ),
      ),
    );
  }
}
