import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/class/status_request.dart';
// import 'package:my_portfolio/core/function/handling_data.dart';
// import 'package:my_portfolio/data/datasource/remote/contactme.dart';

class ContactMeController extends GetxController {
  late TextEditingController controllerName;
  late TextEditingController controllerAddress;
  late TextEditingController controllerNumber;
  late TextEditingController controllerSubject;
  late TextEditingController controllerMessage;

  // final ContactMeData contactMeData = Get.find();
  StatusRequest statusRequest = StatusRequest.noAction;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
  }

  void _initializeControllers() {
    controllerName = TextEditingController();
    controllerAddress = TextEditingController();
    controllerNumber = TextEditingController();
    controllerSubject = TextEditingController();
    controllerMessage = TextEditingController();
  }

  // Future<void> send() async {
  //   if (formKey.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //     var response = await contactMeData.send(
  //       controllerName.text,
  //       controllerAddress.text,
  //       controllerNumber.text,
  //       controllerSubject.text,
  //       controllerMessage.text,
  //     );
  //     statusRequest = handlingData(response);
  //     if (statusRequest != StatusRequest.offlinefailure) {
  //       if (statusRequest == StatusRequest.success) {
  //         if (response['status'] == "success") {
  //           _clearTextFields();
  //           _showSuccessDialog(controllerName.text);
  //         } else {
  //           _showErrorDialog();
  //           statusRequest = StatusRequest.failure;
  //         }
  //       }
  //     }
  //     update();
  //   }
  // }

  void clearTextFields() {
    controllerName.clear();
    controllerAddress.clear();
    controllerNumber.clear();
    controllerSubject.clear();
    controllerMessage.clear();
  }

  void showSuccessDialog(String name) {
    Get.defaultDialog(
      title: "Hi, $name",
      middleText: "Please wait for us to contact you soon",
    );
  }

  void showErrorDialog() {
    Get.defaultDialog(
      middleText: "Please try again",
    );
  }
}
