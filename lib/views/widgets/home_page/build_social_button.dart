import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/color.dart';

class BuildSocialButton extends StatelessWidget {
  const BuildSocialButton(
      {super.key, required this.asset, required this.hover});
  final String asset;
  final bool hover;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.themeColor, width: 2.0),
        color: AppColor.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColor.bgColor : AppColor.themeColor,
        // fit: BoxFit.fill,
      ),
    );
  }
}
