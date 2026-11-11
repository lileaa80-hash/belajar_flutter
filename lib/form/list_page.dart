import 'package:flutter/material.dart';
import 'data.dart';
import 'detail_page.dart';

// HALAMAN 1: Daftar tiket
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  // key = id item, value = jumlah tiket
  final Map<int, int> cart = {};

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Stadion Match',
            style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: Divider(height: 3, thickness: 3, color: kYellow),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          final id = item['id'] as int;
          final qty = cart[id] ?? 0;

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: boxDeco(border: qty > 0 ? kYellow : kCyan),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['name'],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('${item['venue']}  •  ${item['category']}',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white70)),
                      Text(item['date'],
                          style: const TextStyle(
                              fontSize: 12, color: Colors.white70)),
                      const SizedBox(height: 6),
                      Text(rupiah(item['price']),
                          style: const TextStyle(
                              color: kYellow, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                if (qty == 0)
                  smallBtn(Icons.add, () => changeQty(id, 1))
                else
                  Row(
                    children: [
                      smallBtn(Icons.remove, () => changeQty(id, -1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text('$qty',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      smallBtn(Icons.add, () => changeQty(id, 1)),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: cart.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16),
              child: bigButton(
                'LANJUT  (${cartQty(cart)} TIKET)  -  ${rupiah(cartTotal(cart))}',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPage(cart: cart),
                    ),
                  ).then((_) => setState(() {})); // refresh saat balik
                },
              ),
            ),
    );
  }
}