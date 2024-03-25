import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/controller/my_portfolio_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/views/widgets/myportfolio/custom_links_of_social.dart';

class CustomProjectDetials extends StatelessWidget {
  const CustomProjectDetials({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Get.put(MyPortfolioController());
    return GetBuilder<MainDashBoardControllerImp>(builder: (dashcontroller) {
      Project project = dashcontroller.projectsList![index];

      return GetBuilder<MyPortfolioController>(
        builder: (controller) => FadeInUpBig(
          duration: const Duration(milliseconds: 1600),
          child: InkWell(
            onTap: () => controller.onHover(true, index),
            // onHover: (value) => controller.onHover(value, index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: AppColor.bgColor2,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColor.bgColor2, width: 1),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 4.0,
                      blurRadius: 4.5,
                      offset: Offset(3.0, 4.5))
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(project.plImage!),
                            fit: BoxFit.fill,
                            onError: (exception, stackTrace) =>
                                Icon(Icons.apps, color: AppColor.themeColor),
                          ))),
                  Opacity(
                    opacity: 1,
                    child: AnimatedContainer(
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
                            colors: index == controller.hoveredIndex
                                ? AppColor.gradientColorsSelected
                                : AppColor.gradientColors,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            style: AppTextStyles.normalStyle(
                                color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                          Constants.sizedBox(height: 30.0),
                          CustomLinksOfSocial(
                              project: project, projectIndex: index)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
