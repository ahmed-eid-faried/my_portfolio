import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/controller/my_portfolio_controller.dart';
import 'package:my_portfolio/core/class/constants.dart';
import 'package:my_portfolio/core/constant/applink.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/core/constant/fonts.dart';
import 'package:my_portfolio/data/model/projects_list.dart';
import 'package:my_portfolio/views/widgets/custom_image_widget.dart';
import 'package:my_portfolio/views/widgets/myportfolio/custom_links_of_social.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomProjectDetails extends StatelessWidget {
  const CustomProjectDetails({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final dashController = Get.find<MainDashBoardControllerImp>();
    final controller = Get.put(MyPortfolioController());
    ProjectsList project = dashController.projectsList![index];

    return GetBuilder<MyPortfolioController>(
      builder:
          (_) => FadeInUpBig(
            duration: const Duration(milliseconds: 600),
            child: MouseRegion(
              onEnter: (_) => controller.onHover(true, index),
              onExit: (_) => controller.onHover(false, index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                transform:
                    index == controller.hoveredIndex
                        ? (Matrix4.identity()..scale(1.02))
                        : Matrix4.identity(),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Stack(
                    children: [
                      // Background image
                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
                        child:
                            kIsWeb
                                ? CustomImageWidget(
                                  height: 40.h,
                                  width: double.infinity,
                                  image:
                                      "${AppLink.imagePL}/${project.plImage!}",
                                  fitWeb: BoxFitWeb.cover,
                                  fitAndroidIos: BoxFit.cover,
                                  borderRadius: BorderRadius.circular(0),
                                )
                                : CachedNetworkImage(
                                  height: 40.h,
                                  width: double.infinity,
                                  imageUrl:
                                      "${AppLink.imagePL}/${project.plImage!}",
                                  fit: BoxFit.cover,
                                  errorWidget:
                                      (_, __, ___) => Icon(
                                        Icons.broken_image,
                                        color: AppColor.themeColor,
                                      ),
                                ),
                      ),

                      // Dark gradient overlay
                      Positioned.fill(
                        child: AnimatedOpacity(
                          opacity: index == controller.hoveredIndex ? 0.3 : 0.6,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Text content
                      Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.plTitle ?? '',
                              style: AppTextStyles.montserratStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Constants.sizedBox(height: 8),
                            Text(
                              project.plBody ?? '',
                              style: AppTextStyles.normalStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Constants.sizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [CustomLinksOfSocial(project: project)],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
