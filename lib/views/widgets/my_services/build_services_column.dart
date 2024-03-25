import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/controller/my_services_controller.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/views/widgets/my_services/build_animated_container.dart';
import 'package:my_portfolio/views/widgets/my_services/build_my_services_text.dart';

class BuildServicesColumn extends StatelessWidget {
  const BuildServicesColumn({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyServicesController());
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (controllerDash) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BuildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ...List.generate(
                controllerDash.services!.length,
                (index) => BuildAnimatedContainer(
                  title: controllerDash.services![index].servicesTitle!,
                  body: controllerDash.services![index].servicesBody!,
                  asset: controllerDash.services![index].servicesAssets!,
                  index: index,
                  servicesType: controllerDash.services![index].servicesType!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
