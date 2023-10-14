import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyServicesController extends GetxController {
  final RxBool isHovered = false.obs;
  double defaultWidth = 350;
  double hoverWidth = 360;
  final Matrix4 onHoverActive = Matrix4.identity()..translate(0.0, -10.0, 0.0);
  final Matrix4 onHoverRemove = Matrix4.identity()..translate(0.0, 0.0, 0.0);
  bool hover = false;
  List<bool> state = [];

  double get width => hover ? hoverWidth : defaultWidth;
  GlobalKey key = GlobalKey();
  hoverFun(bool hover) {
    hover = !hover;
    update();
  }

  void changeReadState(int index) {
    state[index] = !state[index];
    update();
  }

  numOfLength(String? body) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: body,
        style: const TextStyle(fontSize: 14),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: 200);

    final numberOfLines = textPainter.computeLineMetrics().length;
    return numberOfLines;
  }
}
