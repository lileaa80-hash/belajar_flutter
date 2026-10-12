import 'package:flutter/material.dart';

class ContainerSatu extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/gadi.jpeg"),
          fit: BoxFit.cover,
        ), // DecorationImage
        boxShadow: [
          BoxShadow(
           color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ), // BoxShadow
        ],
      ), // BoxDecoration
      child: Text(
        'lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod',
      ), // Text
    ); // Container
  }
}