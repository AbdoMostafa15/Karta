import 'package:flutter/material.dart';
import 'package:karta/addnewcard.dart';
import 'package:karta/paymentmethod.dart';
// import 'package:karta/reciept.dart';
import 'package:karta/telda.dart';
// import 'package:karta/walletpayment.dart';
// import 'package:karta/balance.dart';
// import 'package:karta/balance/widgets/pay_view.dart';
// import 'package:karta/main.dart';

// void main() {
// runApp(Karta());
// }

class Bankpayment extends StatelessWidget {
  const Bankpayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
      ),
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
                  rowItem("Amount", "10", isBold: true),
                  Divider(color: Colors.black),
                  rowItem("Additional fees", "0", isBold: true),
                  Divider(color: Colors.black),
                  rowItem("Total", "10", isBold: true),
                ],
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Choose payment method",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A5ACD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentMethod()),
                    );
                  },
                  child: Text(
                    "E- Wallet",
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
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shadowColor: Colors.black26,
                    elevation: 5,
                  ),
                  onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => PaymentMethod()),
                    // );
                  },
                  child: Text(
                    "Bank Card",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6a5acd),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addnewcard()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Color(0xff6a5acd)),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Center(
                      child: Icon(Icons.add, color: Colors.black, size: 25),
                    ),
                    SizedBox(width: 10),
                    const Text(
                      "Add New Card",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Telda()),
                );
              },
              child: Text(
                "Pay",
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

  Widget paymentButton(String method) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(color: Color(0xff6a5acd)),
        ),
        onPressed: () {},
        child: Text(method),
      ),
    );
  }
}
