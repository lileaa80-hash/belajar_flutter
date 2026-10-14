import 'package:flutter/material.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    about: (context) => AboutPage(),
  };
}