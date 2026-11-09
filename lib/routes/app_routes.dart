import 'package:flutter/material.dart';
import 'package:rpl2/pages/about_page.dart';
import 'package:rpl2/pages/home_page.dart';
import 'package:rpl2/pages/formulir.dart';
import 'package:rpl2/pages/input_page.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about'; 
  static const formulir = '/formulir';
  static const input = '/input';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    about: (context) => AboutPage(),
    formulir:(context) => Formulir(),
    input :(context) => BelajarForm(),
  };
}