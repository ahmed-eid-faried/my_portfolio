import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/class/helper_class.dart';
import 'package:my_portfolio/views/widgets/my_services/build_services_column.dart';

class MyServices extends StatelessWidget {
  const MyServices({super.key});
  @override
  Widget build(BuildContext context) {
    return HelperClass(
      mobile: const BuildServicesColumn(),
      tablet: const BuildServicesColumn(),
      desktop: const BuildServicesColumn(),
      paddingWidth: Get.width * 0.04,
      bgColor: AppColor.bgColor,
    );
  }
}
