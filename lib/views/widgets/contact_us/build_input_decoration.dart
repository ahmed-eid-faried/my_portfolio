import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';

InputDecoration buildInputDecoration({required String hintText}) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: AppTextStyles.comfortaaStyle(),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      filled: true,
      fillColor: AppColor.bgColor2,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16));
}
