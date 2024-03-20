import 'package:my_portfolio/controller/main_dash_board_controller.dart';
import 'package:my_portfolio/core/class/curd.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/services/services.dart';
// import 'package:my_portfolio/data/datasource/remote/contactme.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put(Curd());
    Get.lazyPut(() => MainDashBoardControllerImp(), fenix: true);
    Get.put(MyService());
    // await Get.putAsync(() => MyService().init());
  }
}
