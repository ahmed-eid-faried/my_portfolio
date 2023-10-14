import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/contact_me_controller.dart';
import 'package:my_portfolio/core/class/app_buttons.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/function/validinput.dart';
import 'package:my_portfolio/views/widgets/contact_us/build_contact_text.dart';
import 'package:my_portfolio/views/widgets/contact_us/build_input_decoration.dart';

class BuildFormSmall extends StatelessWidget {
  const BuildFormSmall({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    ContactMeController controller = Get.put(ContactMeController());
    return Form(
      key: controller.formstate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const BuildContactText(),
          Constants.sizedBox(height: 40.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextFormField(
              validator: (value) => validator(value, "text"),
              controller: controller.controllerName,
              cursorColor: AppColor.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Full Name'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextFormField(
              validator: (value) => validator(value, "email"),
              controller: controller.controllerAddress,
              cursorColor: AppColor.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Email Address'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextFormField(
              validator: (value) => validator(value, "phone"),
              controller: controller.controllerNumber,
              cursorColor: AppColor.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Mobile Number'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextFormField(
              validator: (value) => validator(value, "text"),
              controller: controller.controllerSubject,
              cursorColor: AppColor.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Email Subject'),
            ),
          ),
          Constants.sizedBox(height: 20.0),
          Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            elevation: 8,
            child: TextFormField(
              validator: (value) => validator(value, "text"),
              controller: controller.controllerMessage,
              maxLines: 15,
              cursorColor: AppColor.white,
              style: AppTextStyles.normalStyle(),
              decoration: buildInputDecoration(hintText: 'Your Message'),
            ),
          ),
          Constants.sizedBox(height: 40.0),
          AppButtons.buildMaterialButton(
              buttonName: 'Send Message', onTap: () => controller.send()),
          Constants.sizedBox(height: 30.0),
        ],
      ),
    );
  }
}
