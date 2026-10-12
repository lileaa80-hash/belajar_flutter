import 'package:flutter/material.dart';
// import 'package:rpl2/row_column_widget/Latihan2.dart';
// import 'package:rpl2/container_widget/LatihanContainer.dart';
// import 'package:rpl2/row_column_widget/ColumnWidget.dart';
// import 'package:rpl2/row_column_widget/RowWidget.dart';
// import 'package:rpl2/row_column_widget/RowColumnWidget.dart';
// import 'package:rpl2/sized_expanded_stack/ExpandedWidget.dart';
import 'package:rpl2/sized_expanded_stack/SidezBoxWidget.dart';
// import 'package:rpl2/sized_expanded_stack/StackWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Pertamaku",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("RPL 2"),
          backgroundColor: const Color.fromARGB(255, 24, 112, 194),
          centerTitle: true,
        ),
        body: const StackWidget(),
        
        bottomNavigationBar: const LabelKelas(),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: Colors.black, width: 100),
        Expanded(
          child: Container(color: Colors.red, height: 50, child: const Text("Satu")),
        ),
        Expanded(
          flex: 1,
          child: Container(color: Colors.green, height: 50, child: const Text("Dua")),
        ),
        Expanded(
          child: Container(color: Colors.blue, height: 50, child: const Text("Tiga")),
        ),
      ],
    );
  }
}

class SizedboxWidget extends StatelessWidget {
  const SizedboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text("Baris 1"),
          const SizedBox(height: 10),
          const Text("Baris 2"),
          SizedBox(
            width: 150,
            height: 25,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Tombol"),
            ),
          ),
        ],
      ),
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 200, height: 200, color: Colors.red),
        const Positioned(
          bottom: 10,
          right: 10,
          child: Icon(Icons.favorite, color: Colors.white),
        ),
        const Positioned(
          top: 10,
          left: 10,
          child: Text("label", style: TextStyle(color: Colors.white)),
        ),
        Positioned(
          right: 25,
          top: 25,
          left: 25,
          child: Container(color: Colors.blue, width: 100, height: 100),
        ),
      ],
    );
  }
}

class LabelKelas extends StatelessWidget {
  const LabelKelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: const Text(
        "Kelas XII RPL",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const HelloWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hello Flutter",
        style: TextStyle(
          color: Colors.indigo,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.yellowAccent,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}