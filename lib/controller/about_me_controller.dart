import 'package:get/get.dart';

class AboutMeController extends GetxController {
  bool readMore = false;

  readMoreFun() {
    readMore = !readMore;
    update();
  }
}
