import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/controller/my_portfolio_controller.dart';
import 'package:my_portfolio/core/constant/applink.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/views/widgets/myportfolio/custom_links_of_social.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomProjectDetials extends StatelessWidget {
  const CustomProjectDetials({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Get.put(MyPortfolioController());
    return GetBuilder<MainDashBoardControllerImp>(builder: (dashcontroller) {
      ProjectsList project = dashcontroller.projectsList![index];

      return GetBuilder<MyPortfolioController>(
        builder: (controller) => FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () => controller.onHover(true, index),
            // onHover: (value) => controller.onHover(value, index),
            child: Stack(
              alignment: Alignment.center,
              children: [
                kIsWeb
                    ? Container(
                        height: Adaptive.px(300),
                        width: Adaptive.px(400),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: ImageNetwork(
                          image: "${AppLink.imagePL}/${project.plImage!}",
                          height: Adaptive.px(300),
                          width: Adaptive.px(400),
                          duration: 0,
                          curve: Curves.easeIn,
                          onPointer: true,
                          fitWeb: BoxFitWeb.fill,
                          fitAndroidIos: BoxFit.fill,
                          onLoading: Container(),
                          borderRadius: BorderRadius.circular(20),
                          onError: Icon(Icons.apps, color: AppColor.themeColor),
                        ))
                    : Container(
                        height: Adaptive.px(300),
                        width: Adaptive.px(400),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                "${AppLink.imagePL}/${project.plImage!}",
                                maxHeight: Adaptive.px(300).toInt(),
                                maxWidth: Adaptive.px(400).toInt(),
                              ),
                              fit: BoxFit.fill,
                              onError: (exception, stackTrace) =>
                                  Icon(Icons.apps, color: AppColor.themeColor),
                            ))),
                Opacity(
                  opacity: index == controller.hoveredIndex ? 1 : 0.5,
                  child: AnimatedContainer(
                    height: Adaptive.px(300),
                    width: Adaptive.px(400),
                    duration: const Duration(milliseconds: 600),
                    transform: index == controller.hoveredIndex
                        ? controller.onH0verEffect
                        : null,
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: AppColor.gradientColors,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      children: [
                        Text(
                          project.plTitle.toString(),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: AppTextStyles.montserratStyle(
                              color: Colors.black87, fontSize: 20),
                        ),
                        Constants.sizedBox(height: 15.0),
                        Text(
                          project.plBody.toString(),
                          maxLines: 4,
                          style:
                              AppTextStyles.normalStyle(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                        Constants.sizedBox(height: 30.0),
                        CustomLinksOfSocial(project: project)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
