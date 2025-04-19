import 'package:flutter/material.dart';

class AppColor {
  // static Color bgColor = const Color(0xff002147);
  // static Color themeColor = const Color(0xff99FFFF);
  // static Color aqua = const Color(0xff007A74);
  // static Color lawGreen = const Color(0xff7CFC00);
  // static Color bgColor2 = const Color(0xff00416A);
  // static Color robinEdgeBlue = const Color(0xff00CCCC);
  // static Color white = const Color(0xffffffff);
  // static Color primaryColor = themeColor;
  static Color bgColor = const Color.fromARGB(255, 0, 27, 54); // كحلي أقرب للسواد
  static Color bgColor2 = const Color.fromARGB(255, 0, 43, 71); // كحلي أفتح شوية من الأول
  static Color themeColor = const Color(0xff66ffff);
  // أزرق سماوي فاتح لكن أهدى من القديم
  static Color aqua = const Color(0xff00b3ad); // أزرق مخضر غامق شويه
  static Color lawGreen = const Color(0xff32cd32); // لون أخضر ليموني أغمق وأنعم
  static Color robinEdgeBlue = const Color(0xff00bebe);
  // أزرق مائل للتركواز لكنه أغمق
  static Color white = const Color(0xffe6f1ff);
  // أبيض مائل للرمادي الفاتح (أنعم على الخلفية)
  // static Color themeColor = const Color(0xff00e5ff); // تركواز مشرق
  // static Color aqua = const Color(0xff00bcd4); // أزرق-تركواز لامع
  // static Color lawGreen = const Color(0xff00ff99); // أخضر نعناعي مشرق
  // static Color robinEdgeBlue = const Color(0xff1de9b6); // تركواز مشرق فيه لمعة
  // static Color white = const Color(0xfff0faff); // أبيض مائل للثلجي

  // static Color themeColor = const Color(0xff99FFFF);
  // static Color aqua = const Color(0xff007A74);
  // static Color lawGreen = const Color(0xff7CFC00);
  // static Color robinEdgeBlue = const Color(0xff00CCCC);
  // static Color white = const Color(0xffffffff);
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
