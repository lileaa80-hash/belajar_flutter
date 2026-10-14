import 'package:flutter/material.dart';

class ContohListView extends StatelessWidget {
  const ContohListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh ListView'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Kaka Viangi'),
            subtitle: Text('XII RPL 2'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Andi'),
            subtitle: Text('XII RPL 1'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Budi'),
            subtitle: Text('XII RPL 3'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Siti'),
            subtitle: Text('XII RPL 2'),
          ),
        ],
      ),
    );
  }
}