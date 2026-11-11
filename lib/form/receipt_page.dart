import 'package:flutter/material.dart';
import 'data.dart';

// HALAMAN 3: Struk pembayaran
class ReceiptPage extends StatelessWidget {
  final List<Map<String, dynamic>> lines;
  final int total;
  final String method; // 'cash' / 'qris'
  final int paid;

  const ReceiptPage({
    super.key,
    required this.lines,
    required this.total,
    required this.method,
    required this.paid,
  });

  String _two(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final tanggal =
        '${_two(now.day)}/${_two(now.month)}/${now.year} ${_two(now.hour)}:${_two(now.minute)}';
    final trxId =
        'TRX${now.millisecondsSinceEpoch.toString().substring(5)}';

    const mono = TextStyle(
        fontFamily: 'monospace', color: Colors.black, fontSize: 13);
    const monoBold = TextStyle(
        fontFamily: 'monospace',
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Struk Pembayaran',
            style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: Divider(height: 3, thickness: 3, color: kYellow),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 44),
              const SizedBox(height: 6),
              const Text('PEMBAYARAN BERHASIL',
                  textAlign: TextAlign.center, style: monoBold),
              const Text('TIKET STADION MATCH',
                  textAlign: TextAlign.center, style: mono),
              const SizedBox(height: 10),
              _row('No. Transaksi', trxId, mono),
              _row('Tanggal', tanggal, mono),
              _row('Metode', method.toUpperCase(), mono),
              const Text('- - - - - - - - - - - - - - - - - - - -',
                  style: mono, maxLines: 1, overflow: TextOverflow.clip),

              // Daftar item
              ...lines.map((l) {
                final qty = l['qty'] as int;
                final price = l['price'] as int;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${l['name']} (${l['category']})', style: monoBold),
                      _row('${qty}x ${rupiah(price)}', rupiah(qty * price), mono),
                    ],
                  ),
                );
              }),

              const Text('- - - - - - - - - - - - - - - - - - - -',
                  style: mono, maxLines: 1, overflow: TextOverflow.clip),
              _row('TOTAL', rupiah(total), monoBold),
              _row('Dibayar', rupiah(paid), mono),
              if (method == 'cash') _row('Kembalian', rupiah(paid - total), mono),
              const SizedBox(height: 14),
              const Text('Tunjukkan struk ini saat masuk stadion.',
                  textAlign: TextAlign.center, style: mono),
              const Text('Terima kasih!',
                  textAlign: TextAlign.center, style: mono),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: bigButton('SELESAI', () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }),
      ),
    );
  }

  Widget _row(String left, String right, TextStyle style) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left, style: style),
          Text(right, style: style),
        ],
      ),
    );
  }
}