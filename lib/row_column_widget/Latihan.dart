import 'package:flutter/material.dart';

class Latihanrowcolumn extends StatelessWidget {
  const Latihanrowcolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 300,
        color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 100, height: 100, color: Colors.redAccent),
            Column(
              children: [
                Text("Nama: chao"),
                Text("Kelas: XII TKR"),
                Text("NIS: 20552011131"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}