import 'package:flutter/material.dart';

class ContohListViewSeparated extends StatelessWidget {
  const ContohListViewSeparated({super.key});

  final List<String> namaSiswa = const [
    'celin',
    'erli',
    'eirr',
    'solinaer',
    'cherniey',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Separated'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.separated(
        itemCount: namaSiswa.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.school),
            title: Text(namaSiswa[index]),
            subtitle: const Text('XII RPL'),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }
}