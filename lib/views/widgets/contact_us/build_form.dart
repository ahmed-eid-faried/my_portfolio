import 'package:flutter/material.dart';
import 'package:my_portfolio/core/class/app_buttons.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/core/function/validinput.dart';
import 'package:my_portfolio/views/widgets/contact_us/build_contact_text.dart';
import 'package:my_portfolio/views/widgets/contact_us/build_input_decoration.dart';

class BuildForm extends StatelessWidget {
  const BuildForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const BuildContactText(),
        Constants.sizedBox(height: 40.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value) => validator(value, "text"),
                  cursorColor: AppColor.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Full Name'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value) => validator(value, "email"),
                  cursorColor: AppColor.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Address'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Row(
          children: [
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value) => validator(value, "phone"),
                  cursorColor: AppColor.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Mobile Number'),
                ),
              ),
            ),
            Constants.sizedBox(width: 20.0),
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                elevation: 8,
                child: TextFormField(
                  validator: (value) => validator(value, "text"),
                  cursorColor: AppColor.white,
                  style: AppTextStyles.normalStyle(),
                  decoration: buildInputDecoration(hintText: 'Email Subject'),
                ),
              ),
            ),
          ],
        ),
        Constants.sizedBox(height: 20.0),
        Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          elevation: 8,
          child: TextFormField(
            validator: (value) => validator(value, "text"),
            maxLines: 15,
            cursorColor: AppColor.white,
            style: AppTextStyles.normalStyle(),
            decoration: buildInputDecoration(hintText: 'Your Message'),
          ),
        ),
        Constants.sizedBox(height: 40.0),
        AppButtons.buildMaterialButton(
            buttonName: 'Send Message', onTap: () {}),
        Constants.sizedBox(height: 30.0),
      ],
    );
  }
}
