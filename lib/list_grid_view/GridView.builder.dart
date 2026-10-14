import 'package:flutter/material.dart';

class ContohGridViewBuilder extends StatelessWidget {
  const ContohGridViewBuilder({super.key});

  final List<String> namaSiswa = const [
    'cherniey',
    'solinaer',
    'err',
    'eirr',
    'celinn',
    'naer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView Builder'),
        backgroundColor: const Color.fromARGB(255, 39, 104, 139),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemCount: namaSiswa.length,
        itemBuilder: (context, index) {
          return Card(
            color: const Color.fromARGB(255, 29, 86, 125),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    namaSiswa[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}