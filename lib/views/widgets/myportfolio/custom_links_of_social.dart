import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/my_portfolio_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/imgaeasset.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/views/widgets/home_page/build_social_button.dart';

class CustomLinksOfSocial extends StatelessWidget {
  const CustomLinksOfSocial({
    super.key,
    required this.project,
    required this.projectIndex,
  });
  final Project project;
  final int projectIndex;
  @override
  Widget build(BuildContext context) {
    Get.put(MyPortfolioController());
    var linkButtons = [
      project.plGoogleplay,
      project.plAppstore,
      project.plGithub,
      project.plDoc,
      project.plWeb,
      project.plWindows,
      project.plLinux,
      project.plMacos,
      project.plCli,
      project.plEmbedded,
      project.plPackage,
    ];
    var assetsButtons = [
      AppAssets.googleplay,
      AppAssets.appstore,
      AppAssets.github,
      AppAssets.doc,
      AppAssets.web,
      AppAssets.windows,
      AppAssets.linux,
      AppAssets.mac,
      AppAssets.code,
      AppAssets.embedded,
      AppAssets.package,
    ];
    return GetBuilder<MyPortfolioController>(
      builder: (controller) => SizedBox(
        child: Wrap(
          runSpacing: 4,
          spacing: 4,
          children: List.generate(
              linkButtons.length > 10 ? 10 : linkButtons.length, (index) {
            return linkButtons[index] == null ||
                    linkButtons[index] == " " ||
                    linkButtons[index] == ""
                ? const Text("")
                : InkWell(
                    onTap: () => controller.link(linkButtons[index]!),
                    onHover: (value) => controller.fun(value, index),
                    borderRadius: BorderRadius.circular(550.0),
                    hoverColor: AppColor.themeColor,
                    splashColor: AppColor.bgColor2,
                    child: BuildSocialButton(
                        asset: assetsButtons[index],
                        hover: controller.socialBI == index
                            ? (projectIndex == controller.hoveredIndex)
                            : false),
                  );
          }),
        ),
      ),
    );
  }
}
