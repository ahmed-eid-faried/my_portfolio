import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';

class AppButtons {
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColor.themeColor,
      splashColor: AppColor.bgColor2,
      hoverColor: AppColor.aqua,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      elevation: 7,
      height: 46,
      minWidth: 130,
      focusElevation: 12,
      child: Text(
        buttonName,
        style: AppTextStyles.headerTextStyle(color: Colors.black),
      ),
    );
  }
}
