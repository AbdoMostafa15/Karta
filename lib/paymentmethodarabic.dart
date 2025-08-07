import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:karta/bankpaymentarabic.dart';
import 'package:karta/walletpaymentarabic.dart';

class PaymentMethodarabic extends StatelessWidget {
  const PaymentMethodarabic({super.key});

  Future<void> savePaymentHistory(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final vehicle = prefs.getString('selected_vehicle') ?? 'Unknown vehicle';
    final now = DateTime.now();
    final formattedTime = DateFormat('dd/MM/yyyy HH:mm').format(now);

    final entry = '$formattedTime - $vehicle';

    final List<String> history = prefs.getStringList('payment_history') ?? [];
    history.add(entry);

    await prefs.setStringList('payment_history', history);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  rowItem("المبلغ", "10"),
                  Divider(color: Colors.black),
                  rowItem("مصروفات اضافية", "0"),
                  Divider(color: Colors.black),
                  rowItem("الاجمالي", "10", isBold: true),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "اختر طريقة الدفع",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A5ACD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 29, vertical: 12),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodarabic(),
                      ),
                    );
                  },
                  child: Text(
                    "بطاقة الكترونية",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 70),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 29, vertical: 12),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Bankpaymentarabic(),
                      ),
                    );
                  },
                  child: Text(
                    "بطاقة بنكية",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6a5acd),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "اختر رقم",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff6a5acd),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                await savePaymentHistory(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Walletarabic()),
                );
              },
              child: Text(
                "ادفع",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowItem(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
