import 'package:my_portfolio/core/class/curd.dart';
import 'package:my_portfolio/core/constant/applink.dart';

class ContactMeData {
  Curd curd;
  ContactMeData(this.curd);
  send(String? name, String? address, String? number, String? subject,
      String? message) async {
    var response = await curd.postData(AppLink.message, {
      "cm_name": name,
      "cm_address": address,
      "cm_number": number,
      "cm_subject": subject,
      "cm_message": message,
    });
    return response.fold((l) => l, (r) => r);
  }
}
