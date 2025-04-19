import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/my_portfolio_controller.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/imgaeasset.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/views/widgets/home_page/build_social_button.dart';

class CustomLinksOfSocial extends StatefulWidget {
  const CustomLinksOfSocial({super.key, required this.project});
  final ProjectsList project;

  @override
  State<CustomLinksOfSocial> createState() => _CustomLinksOfSocialState();
}

class _CustomLinksOfSocialState extends State<CustomLinksOfSocial> {
  @override
  Widget build(BuildContext context) {
    Get.put(MyPortfolioController());
    var linkButtons = [
      widget.project.plGoogleplay,
      widget.project.plAppstore,
      widget.project.plGithub,
      widget.project.plDoc,
      widget.project.plWeb,
    ];
    var assetsButtons = [
      AppAssets.googleplay,
      AppAssets.appstore,
      AppAssets.github,
      AppAssets.doc,
      AppAssets.web,
    ];
    var socialBI;

    return GetBuilder<MyPortfolioController>(
      builder:
          (controller) =>
          // Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          //   if (project.plGoogleplay != null)
          //     InkWell(
          //       onTap: () => controller.link(project.plAppstore!),
          //       child: CircleAvatar(
          //         maxRadius: 25,
          //         backgroundColor: Colors.white,
          //         child: Image.asset(
          //           AppAssets.googleplay,
          //           width: 25,
          //           height: 25,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //   if (project.plAppstore != null)
          //     InkWell(
          //       onTap: () => controller.link(project.plAppstore!),
          //       child: CircleAvatar(
          //         maxRadius: 25,
          //         backgroundColor: Colors.white,
          //         child: Image.asset(
          //           AppAssets.appstore,
          //           width: 25,
          //           height: 25,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //   if (project.plGithub != null)
          //     InkWell(
          //       onTap: () => controller.link(project.plGithub!),
          //       child: CircleAvatar(
          //         maxRadius: 25,
          //         backgroundColor: Colors.white,
          //         child: Image.asset(
          //           AppAssets.github,
          //           width: 25,
          //           height: 25,
          //           fit: BoxFit.fill,
          //         ),
          //       ),
          //     ),
          //   if (project.plDoc != null)
          //     InkWell(
          //         onTap: () => controller.link(project.plDoc!),
          //         child: CircleAvatar(
          //           maxRadius: 25,
          //           backgroundColor: Colors.white,
          //           child: Image.asset(
          //             AppAssets.doc,
          //             width: 25,
          //             height: 25,
          //             fit: BoxFit.fill,
          //           ),
          //         ))
          // ])
          SizedBox(
            height: 48,
            child: ListView.separated(
              itemCount: linkButtons.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder:
                  (context, child) => Constants.sizedBox(width: 8.0),
              itemBuilder: (context, index) {
                return linkButtons[index] == null || linkButtons[index] == " "
                    ? const Text("")
                    : InkWell(
                      onTap: () => controller.link(linkButtons[index]!),
                      onHover: (value) {
                        setState(() {
                          if (value) {
                            socialBI = index;
                          } else {
                            socialBI = null;
                          }
                        });

                        controller.fun(value, index);
                      },
                      borderRadius: BorderRadius.circular(550.0),
                      hoverColor: AppColor.themeColor,
                      splashColor: AppColor.bgColor2,
                      child: BuildSocialButton(
                        asset: assetsButtons[index],
                        hover: socialBI == index ? true : false,
                      ),
                    );
              },
            ),
          ),
    );
  }
}
