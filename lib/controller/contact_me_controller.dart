import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/class/status_request.dart';
import 'package:my_portfolio/core/function/handling_data.dart';
import 'package:my_portfolio/data/datasource/remote/contactme.dart';

class ContactMeController extends GetxController {
  TextEditingController? controllerName;
  TextEditingController? controllerAddress;
  TextEditingController? controllerNumber;
  TextEditingController? controllerSubject;
  TextEditingController? controllerMessage;
  ContactMeData contactMeData = ContactMeData(Get.find());
  StatusRequest statusRequest = StatusRequest.noAction;
  GlobalKey<FormState> formstate = GlobalKey();
  Future<void> send() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await contactMeData.send(
        controllerName!.text,
        controllerAddress!.text,
        controllerNumber!.text,
        controllerSubject!.text,
        controllerMessage!.text,
      );
      statusRequest = handlingData(response);
      if (statusRequest != StatusRequest.offlinefailure) {
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == "success") {
            controllerName!.text = "";
            controllerAddress!.text = "";
            controllerNumber!.text = "";
            controllerSubject!.text = "";
            controllerMessage!.text = "";
            Get.defaultDialog(
                title: "Hi, ${controllerName!.text}",
                middleText: "Please wait for us to contact you soon");
          } else {
            Get.defaultDialog(middleText: "Please try again");
            statusRequest = StatusRequest.failure;
          }
        }
      }
      update();
    }
  }

  intialData() {
    controllerName = TextEditingController();
    controllerAddress = TextEditingController();
    controllerNumber = TextEditingController();
    controllerSubject = TextEditingController();
    controllerMessage = TextEditingController();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
