import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Ini Isi Row 1"),
        Text("Ini Isi Row 2"),
        Text("Ini Isi Row 3"),
        FlutterLogo(
          size: 50,
          textColor: Colors.blue,
        )

      ],
    );
  }
}