import 'package:my_portfolio/core/class/curd.dart';
import 'package:my_portfolio/core/constant/applink.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);
  getData() async {
    var response = await curd.getData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }
}
