
import 'package:flutter/material.dart';

class ContohGridView extends StatelessWidget {
  const ContohGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final double widthScreen = mediaQueryData.size.width;
    final double heightScreen =
        mediaQueryData.size.height -
        mediaQueryData.padding.top -
        kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Basic'),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: widthScreen,
        height: heightScreen,
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Card(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Kaka Viangi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.green,
              child: Center(
                child: Text(
                  'Andi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.orange,
              child: Center(
                child: Text(
                  'Budi',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Card(
              color: Colors.red,
              child: Center(
                child: Text(
                  'Siti',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}