import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/class/helper_class.dart';
import 'package:my_portfolio/views/widgets/contact_us/build_form.dart';
import 'package:my_portfolio/views/widgets/contact_us/build_form_small.dart';
 
class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HelperClass(
      mobile: const BuildFormSmall(),
      tablet: const BuildForm(),
      desktop: const BuildForm(),
      paddingWidth: Get.width * 0.2,
      bgColor: AppColor .bgColor,
    );
  }
}
