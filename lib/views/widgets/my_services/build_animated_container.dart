import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:my_portfolio/controller/contact_me_controller.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/controller/my_services_controller.dart';
import 'package:my_portfolio/core/class/app_buttons.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/data/datasource/static/static.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuildAnimatedContainer extends StatelessWidget {
  const BuildAnimatedContainer({
    Key? key,
    required this.title,
    required this.asset,
    required this.body,
    required this.servicesType,
    required this.index,
  }) : super(key: key);

  final String title;
  final String asset;
  final String body;
  final String servicesType;
  final int index;

  @override
  Widget build(BuildContext context) {
    Get.put(ContactMeController());
    Get.put(MyServicesController());
    Get.put(MainDashBoardControllerImp());
    print("asset:-$asset");
    return GetBuilder<ContactMeController>(
      builder: (contactMeController) => GetBuilder<MainDashBoardControllerImp>(
          builder: (controllerDash) =>
              GetBuilder<MyServicesController>(builder: (controller) {
                controller.state.add(false);
                return InkWell(
                  onHover: (value) => controller.hoverFun(controller.hover),
                  child: AnimatedContainer(
                    margin: const EdgeInsets.all(10),
                    duration: const Duration(milliseconds: 300),
                    width: controller.width,
                    height: (controller.numOfLength(body) > 5 &&
                            controller.state[index] == true)
                        ? null
                        : (controller.hover ? 420 : 410),
                    alignment: Alignment.center,
                    transform: controller.hover
                        ? controller.onHoverActive
                        : controller.onHoverRemove,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 24),
                    decoration: BoxDecoration(
                      color: AppColor.bgColor2,
                      borderRadius: BorderRadius.circular(30),
                      border: controller.hover
                          ? Border.all(color: AppColor.themeColor, width: 3)
                          : null,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            spreadRadius: 4.0,
                            blurRadius: 4.5,
                            offset: Offset(3.0, 4.5))
                      ],
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        kIsWeb
                            ? ImageNetwork(
                                image: asset,
                                height: Adaptive.px(60),
                                width: Adaptive.px(60),
                                duration: 1,
                                curve: Curves.easeIn,
                                onPointer: true,
                                debugPrint: false,
                                fullScreen: false,
                                fitWeb: BoxFitWeb.fill,
                                fitAndroidIos: BoxFit.fill,
                                onLoading: Container(),
                                onError: Icon(Icons.code,
                                    color: AppColor.themeColor),
                              )
                            : CachedNetworkImage(
                                imageUrl: asset,
                                width: 60,
                                height: 60,
                                errorListener: (p0) => const Icon(Icons.code),
                                color: AppColor.themeColor),
                        Constants.sizedBox(height: 30.0),
                        Text(
                          title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.montserratStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        Constants.sizedBox(height: 12.0),
                        Text(
                          body,
                          style: AppTextStyles.normalStyle(fontSize: 14.0),
                          textAlign: TextAlign.center,
                          maxLines: controller.state[index] ? 100 : 5,
                          key: ValueKey(index),
                        ),
                        if (controller.numOfLength(body) > 5)
                          InkWell(
                            child: Text(
                              controller.state[index]
                                  ? 'Read Less'
                                  : 'Read More',
                              style: AppTextStyles.normalStyle(
                                  fontSize: 14.0, color: AppColor.primaryColor),
                              textAlign: TextAlign.center,
                            ),
                            onTap: () {
                              controller.changeReadState(index);
                            },
                          ),
                        Constants.sizedBox(height: 20.0),
                        AppButtons.buildMaterialButton(
                            buttonName: 'Hire me',
                            onTap: () async {
                              await controllerDash.scrollTo(
                                  index: screensList.length - 2);
                              contactMeController.controllerSubject!.text =
                                  controllerDash.services![index].servicesType!;
                              contactMeController.update();
                            }),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
