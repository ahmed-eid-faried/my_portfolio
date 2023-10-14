import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constant/imgaeasset.dart';
import 'package:my_portfolio/views/screen/about_me.dart';
import 'package:my_portfolio/views/screen/contact_us.dart';
import 'package:my_portfolio/views/screen/footer_class.dart';
import 'package:my_portfolio/views/screen/home_page.dart';
import 'package:my_portfolio/views/screen/my_portfolio.dart';
import 'package:my_portfolio/views/screen/my_services.dart';

final mySkills = <String>[
  'Flutter Developer',
  'Mobile Developer',
  'Web Developer',
  'Desktop Developer',
  'Freelancer',
];
final menuItems = <String>[
  'Home',
  'About',
  'Services',
  'Portfolio',
  'Contact',
];

const screensList = <Widget>[
  HomePage(),
  AboutMe(),
  MyServices(),
  MyPortfolio(),
  ContactUs(),
  FooterClass(),
];
final socialButtons = <String>[
  AppAssets.facebook,
  AppAssets.linkedIn,
  AppAssets.github,
  AppAssets.whatsapp,
  AppAssets.email,
];

final footerButtons = <String>[
  AppAssets.linkedIn,
  AppAssets.github,
  AppAssets.whatsapp,
  AppAssets.email,
];
