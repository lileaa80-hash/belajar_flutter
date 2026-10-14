import 'package:flutter/material.dart';

class ContohListViewBuilder extends StatelessWidget {
  const ContohListViewBuilder({super.key});

  final List<String> namaSiswa = const [
    'err',
    'celin',
    'solinaer',
    'eirr',
    'cherniey',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Builder'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: namaSiswa.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(namaSiswa[index]),
            subtitle: const Text('Siswa SMK Assalaam Bandung'),
          );
        },
      ),
    );
  }
}