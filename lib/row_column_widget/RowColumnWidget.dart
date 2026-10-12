import 'package:flutter/material.dart';

class Rowcolumnwidget extends StatelessWidget {
  const new({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.grey[400],
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.call, size: 24), Text("Call")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.route, size: 24), Text("Route")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Icon(Icons.share, size: 24), Text("Share")],
            ),
          ],
        )
      )
    );  
  }
}