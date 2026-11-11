import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data.dart';
import 'receipt_page.dart';

// HALAMAN 2: Detail item (multi items) + pembayaran (cash & QRIS)
class DetailPage extends StatefulWidget {
  final Map<int, int> cart; // id -> qty
  const DetailPage({super.key, required this.cart});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String method = 'cash'; // 'cash' atau 'qris'
  final TextEditingController cashCtrl = TextEditingController();

  Map<int, int> get cart => widget.cart;

  int get total => cartTotal(cart);
  int get cash => int.tryParse(cashCtrl.text) ?? 0;

  void changeQty(int id, int delta) {
    setState(() {
      final qty = (cart[id] ?? 0) + delta;
      if (qty <= 0) {
        cart.remove(id);
      } else {
        cart[id] = qty;
      }
    });
  }

  void pay() {
    if (cart.isEmpty) return;

    if (method == 'cash' && cash < total) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Uang cash kurang dari total bayar')),
      );
      return;
    }

    // Susun data struk (List of Map)
    final List<Map<String, dynamic>> lines = [];
    cart.forEach((id, qty) {
      final item = findItem(id);
      lines.add({
        'name': item['name'],
        'category': item['category'],
        'price': item['price'],
        'qty': qty,
      });
    });

    final int paid = method == 'cash' ? cash : total;
    final int totalBayar = total;

    cart.clear(); // kosongkan keranjang setelah bayar

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ReceiptPage(
          lines: lines,
          total: totalBayar,
          method: method,
          paid: paid,
        ),
      ),
    );
  }

  @override
  void dispose() {
    cashCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final change = cash - total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: Divider(height: 3, thickness: 3, color: kYellow),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('TIKET DIPESAN',
              style: TextStyle(color: kGreen, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          if (cart.isEmpty)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: boxDeco(),
              child: const Center(child: Text('Belum ada tiket dipilih')),
            ),

          // Multi items
          ...cart.keys.map((id) {
            final item = findItem(id);
            final qty = cart[id]!;
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: boxDeco(),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text('${item['category']}  •  ${item['date']}',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.white70)),
                        const SizedBox(height: 4),
                        Text(rupiah((item['price'] as int) * qty),
                            style: const TextStyle(color: kYellow)),
                      ],
                    ),
                  ),
                  smallBtn(Icons.remove, () => changeQty(id, -1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text('$qty',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  smallBtn(Icons.add, () => changeQty(id, 1)),
                ],
              ),
            );
          }),

          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: boxDeco(border: kYellow),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('TOTAL',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(rupiah(total),
                    style: const TextStyle(
                        color: kYellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text('METODE PEMBAYARAN',
              style: TextStyle(color: kGreen, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(child: _methodTab('cash', 'CASH', Icons.payments)),
              const SizedBox(width: 10),
              Expanded(child: _methodTab('qris', 'QRIS', Icons.qr_code_2)),
            ],
          ),
          const SizedBox(height: 12),

          if (method == 'cash') _cashSection(change) else _qrisSection(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: bigButton(
          method == 'cash' ? 'BAYAR CASH' : 'SAYA SUDAH BAYAR',
          cart.isEmpty ? null : pay,
        ),
      ),
    );
  }

  Widget _methodTab(String value, String label, IconData icon) {
    final active = method == value;
    return InkWell(
      onTap: () => setState(() => method = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: active ? kCyan : kPanel,
          border: Border.all(color: active ? kYellow : kCyan, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _cashSection(int change) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: boxDeco(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Uang diterima'),
          const SizedBox(height: 8),
          TextField(
            controller: cashCtrl,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              prefixText: 'Rp ',
              hintText: '0',
              filled: true,
              fillColor: kBg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: kCyan, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              ActionChip(
                label: const Text('Uang pas'),
                onPressed: () => setState(() => cashCtrl.text = '$total'),
              ),
              ActionChip(
                label: const Text('100.000'),
                onPressed: () => setState(() => cashCtrl.text = '100000'),
              ),
              ActionChip(
                label: const Text('200.000'),
                onPressed: () => setState(() => cashCtrl.text = '200000'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Kembalian'),
              Text(
                change >= 0 ? rupiah(change) : 'Kurang ${rupiah(-change)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: change >= 0 ? kGreen : Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qrisSection() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: boxDeco(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: const Icon(Icons.qr_code_2, size: 180, color: Colors.black),
          ),
          const SizedBox(height: 10),
          Text('Scan untuk bayar ${rupiah(total)}'),
          const Text('(QR contoh, bukan QRIS asli)',
              style: TextStyle(fontSize: 11, color: Colors.white54)),
        ],
      ),
    );
  }
}