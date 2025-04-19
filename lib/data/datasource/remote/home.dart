import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:my_portfolio/core/class/curd.dart';
import 'package:my_portfolio/core/constant/applink.dart';

class HomeData {
  Curd curd;
  HomeData(this.curd);
  getData() async {
    var response = await curd.postData(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  getStaticData() async {
    // Load the JSON file from assets
    String jsonString = await rootBundle.loadString('/my_portfolio.json');
    // Parse the JSON string
    var response = jsonDecode(jsonString);
    return response;
  }
}
