import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPortfolioController extends GetxController {
  final onH0verEffect = Matrix4.identity()..scale(1.0);
  int? hoveredIndex;

  onHover(bool value, int index) {
    if (value) {
      hoveredIndex = index;
    } else {
      hoveredIndex = null;
    }
    update();
  }

  Future<void> link(String url) async {
    // ignore: unnecessary_null_comparison
    if (url != null && url != '') {
      final Uri url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
      }
    }
  }

  int? socialBI;

  fun(bool value, int index) {
    if (value) {
      socialBI = index;
    } else {
      socialBI = null;
    }
    update();
  }
}
