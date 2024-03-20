import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/constant/color.dart';
import 'package:my_portfolio/views/widgets/footer/custom_footer_buttons.dart';

class FooterClass extends StatelessWidget {
  const FooterClass({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Get.put(MainDashBoardControllerImp());
    return GetBuilder<MainDashBoardControllerImp>(
      builder: (dashcontroller) => Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        color: AppColor.bgColor2,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CustomFooterButtons(),
            InkWell(
              onTap: () async => await dashcontroller.scrollTo(index: 0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.themeColor),
                child: const Icon(
                  Icons.arrow_upward,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
