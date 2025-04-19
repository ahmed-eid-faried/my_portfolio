import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';

class CustomImageWidget extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final int duration;
  final Curve curve;
  final bool onPointer;
  final BoxFitWeb fitWeb;
  final BoxFit fitAndroidIos;
  final Widget? onError;
  final Widget? onLoading;
  final BorderRadius? borderRadius;
  final Color? color;
  const CustomImageWidget({
    super.key,
    required this.image,
    required this.width,
    required this.height,
    this.duration = 1500,
    this.curve = Curves.easeIn,
    this.onPointer = true,
    this.fitWeb = BoxFitWeb.fill,
    this.fitAndroidIos = BoxFit.fill,
    this.onError,
    this.onLoading,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainDashBoardControllerImp>(
      builder:
          (dashcontroller) =>
              dashcontroller.isStatic
                  ? Image.asset(
                    image,
                    width: width,
                    height: height,
                    fit: fitAndroidIos,
                    color: color,
                    errorBuilder:
                        (context, error, stackTrace) =>
                            onError ??
                            Icon(
                              Icons.error,
                              color: color ?? AppColor.themeColor,
                            ),
                  )
                  : ImageNetwork(
                    image: image,
                    width: width,
                    height: height,
                    duration: duration,
                    curve: curve,
                    onPointer: onPointer,
                    fitWeb: fitWeb,
                    fitAndroidIos: fitAndroidIos,
                    onLoading: onLoading ?? Container(),
                    onError:
                        onError ??
                        Icon(Icons.error, color: color ?? AppColor.themeColor),
                  ),
    );
  }
}
