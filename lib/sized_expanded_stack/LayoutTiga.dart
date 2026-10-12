import 'package:flutter/material.dart';

class KartuDashboard extends StatelessWidget {
  const KartuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              color: Colors.blue[100],
              alignment: Alignment.center,
              child: Text("Pemasukan"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              color: Colors.green[100],
              alignment: Alignment.center,
              child: Text("Pengeluaran"),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 80,
              color: Colors.orange[100],
              alignment: Alignment.center,
              child: Text("Saldo"),
            ),
          ),
        ],
      ),
    );
  }
}