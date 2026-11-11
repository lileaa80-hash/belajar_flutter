import 'package:flutter/material.dart';

// ===== Warna tema (ungu soft) =====
const Color kBg = Color(0xFF2B2140);
const Color kPanel = Color(0xFF3D3060);
const Color kCyan = Color(0xFF9B72E8);
const Color kYellow = Color(0xFFFFA8D9);
const Color kGreen = Color(0xFF7CE8B8);

// ===== Data tiket (pakai List & Map, tanpa model) =====
final List<Map<String, dynamic>> items = [
  {
    'id': 1,
    'name': 'Persib vs Persija',
    'venue': 'Stadion GBLA',
    'date': '20 Des 2026, 19.00',
    'category': 'Tribun Utara',
    'price': 75000,
  },
  {
    'id': 2,
    'name': 'Persib vs Arema',
    'venue': 'Stadion Si Jalak Harupat',
    'date': '27 Des 2026, 15.30',
    'category': 'Tribun Timur',
    'price': 60000,
  },
  {
    'id': 3,
    'name': 'Persib vs Persebaya',
    'venue': 'Stadion GBLA',
    'date': '3 Jan 2027, 19.00',
    'category': 'VIP',
    'price': 250000,
  },
  {
    'id': 4,
    'name': 'Persib vs Bali United',
    'venue': 'Stadion GBLA',
    'date': '10 Jan 2027, 16.00',
    'category': 'Tribun Selatan',
    'price': 50000,
  },
  {
    'id': 5,
    'name': 'Persib vs PSIS',
    'venue': 'Stadion Si Jalak Harupat',
    'date': '17 Jan 2027, 19.00',
    'category': 'Tribun Barat',
    'price': 100000,
  },
];

// ===== Helper =====
Map<String, dynamic> findItem(int id) =>
    items.firstWhere((e) => e['id'] == id);

int cartTotal(Map<int, int> cart) {
  int total = 0;
  cart.forEach((id, qty) {
    total += (findItem(id)['price'] as int) * qty;
  });
  return total;
}

int cartQty(Map<int, int> cart) => cart.values.fold(0, (a, b) => a + b);

String rupiah(int n) {
  final s = n.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}

// ===== Widget kecil yang dipakai di semua halaman =====
BoxDecoration boxDeco({Color border = kCyan}) => BoxDecoration(
      color: kPanel,
      border: Border.all(color: border, width: 2),
    );

Widget bigButton(String label, VoidCallback? onTap) {
  return SizedBox(
    width: double.infinity,
    height: 52,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kCyan,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey.shade800,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: kYellow, width: 2),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    ),
  );
}

Widget smallBtn(IconData icon, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: kBg,
        border: Border.all(color: kCyan, width: 2),
      ),
      child: Icon(icon, size: 18, color: Colors.white),
    ),
  );
}