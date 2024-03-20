import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/binding/bindings.dart';
import 'package:my_portfolio/core/constant/routes.dart';
import 'package:my_portfolio/core/services/services.dart';
import 'package:my_portfolio/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// test github actions
void main() async {
  await initService();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'My Portfolio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialBinding: MyBindings(),
        initialRoute: AppRoute.mainDashBoard,
        getPages: pages,
      );
    });
  }
}
