import 'package:flutter/material.dart';

class AppColor {
  static Color bgColor = const Color(0xff002147);
  static Color themeColor = const Color(0xff99FFFF);
  static Color aqua = const Color(0xff007A74);
  static Color lawGreen = const Color(0xff7CFC00);
  static Color bgColor2 = const Color(0xff00416A);
  static Color robinEdgeBlue = const Color(0xff00CCCC);
  static Color white = const Color(0xffffffff);
    static Color primaryColor = themeColor;

  // ////////////////////////////////////////////////////////////

  static List<Color> gradientColors = [
    aqua.withOpacity(1.0),
    aqua.withOpacity(0.9),
    aqua.withOpacity(0.8),
    aqua.withOpacity(0.7),
    aqua.withOpacity(0.6),
    aqua.withOpacity(0.5),
    aqua.withOpacity(0.4),
    // aqua.withOpacity(0.3),
    // aqua.withOpacity(0.2),
    // aqua.withOpacity(0.1),
    // aqua.withOpacity(0.0),
  ];

}
