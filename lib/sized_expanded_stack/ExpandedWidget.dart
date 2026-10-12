import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: Colors.black, width: 100),
        Expanded(
          child: Container(color: Colors.red, height: 50, child: Text("Satu")),
        ), // Expanded
        Expanded(
          flex: 1,
          child: Container(color: Colors.green, height: 50, child: Text("Dua")),
        ), // Expanded
        Expanded(
          child: Container(color: Colors.blue, height: 50, child: Text("Tiga")),
        ), // Expanded
      ],
    ); // Row
  }
}