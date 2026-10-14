import 'package:flutter/material.dart';

class GridBasic extends StatelessWidget {
  GridBasic({super.key});

  @override
  Widget build(BuildContext context) {
    // media query fungsinya untuk menentukan ketinggian dan kelebaran
    // dari layout yang kita buat agar responsive
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen = mediaQueryData.size.height;

    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: widthScreen / heightScreen,
        // scrollDirection: Axis.horizontal,
        children: [
          Container(
            child: Center(child: Text("1")),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text("2")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text("3")),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text("4")),
          ),
        ],
      ),
    );
  }
}