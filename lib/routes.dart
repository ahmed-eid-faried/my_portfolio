import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio/core/constant/routes.dart';
import 'package:my_portfolio/views/screen/about_me.dart';
import 'package:my_portfolio/views/screen/contact_us.dart';
import 'package:my_portfolio/views/screen/home_page.dart';
import 'package:my_portfolio/views/screen/main_dashboard.dart';
import 'package:my_portfolio/views/screen/my_portfolio.dart';
import 'package:my_portfolio/views/screen/my_services.dart';

List<GetPage>? pages = [
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(name: AppRoute.abouteme, page: () => const AboutMe()),
  GetPage(name: AppRoute.myservices, page: () => const MyServices()),
  GetPage(name: AppRoute.myporfolio, page: () => const MyPortfolio()),
  GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
  GetPage(
      name: AppRoute.mainDashBoard,
      page: () => const MainDashBoard(),
      curve: Curves.easeInCirc),
];
