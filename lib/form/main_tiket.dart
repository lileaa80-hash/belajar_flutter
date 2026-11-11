import 'package:flutter/material.dart';
import 'data.dart';
import 'list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiket Stadion Match',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBg,
        colorScheme: const ColorScheme.dark(primary: kCyan, secondary: kYellow),
        appBarTheme: const AppBarTheme(
          backgroundColor: kBg,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: const ListPage(),
    );
  }
}