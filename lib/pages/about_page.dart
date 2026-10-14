import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Halaman About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            // 1. ElevatedButton
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
            const SizedBox(height: 12),

            // 2. FilledButton
            FilledButton(
              onPressed: () {
                print('FilledButton diklik');
              },
              child: const Text('Filled Button'),
            ),
            const SizedBox(height: 12),

            // 3. OutlinedButton
            OutlinedButton(
              onPressed: () {
                print('OutlinedButton diklik');
              },
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 12),

            // 4. TextButton
            TextButton(
              onPressed: () {
                print('TextButton diklik');
              },
              child: const Text('Text Button'),
            ),
          ],
        ),
      ),
    );
  }
}