import 'package:flutter/material.dart';

class Latihan2 extends StatelessWidget {
  const Latihan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tombol Persib
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Persib",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Dua Kotak Merah
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 80, height: 80, color: Colors.red[300]),
                const SizedBox(width: 20),
                Container(width: 80, height: 80, color: Colors.red[300]),
              ],
            ),
            const SizedBox(height: 20),

            // Kotak Biru Muda Atas
            Container(width: 200, height: 60, color: Colors.cyan[200]),
            const SizedBox(height: 15),

            // Kotak Biru Muda Bawah (Biodata)
            Container(
              width: 200,
              padding: const EdgeInsets.all(12),
              color: Colors.cyan[200],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama: chao", style: TextStyle(fontSize: 12)),
                  Text("Kelas: XII TKR", style: TextStyle(fontSize: 12)),
                  Text("NIS: 20552011131", style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}