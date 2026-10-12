import 'package:flutter/material.dart';

class LatihanContainer extends StatelessWidget {
  const LatihanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Container(
        width: 300,
        height: 200,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(color: Colors.green.shade900, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Text(
          'SMK ASSALAAM BANDUNG',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class LabelKelas extends StatelessWidget {
  const LabelKelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      child: Container(
        width: 200,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 47, 20, 138),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'Kelas XII RPL',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}