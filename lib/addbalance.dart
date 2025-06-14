import 'package:flutter/material.dart';
// import 'package:karta/balance/widgets/pay_view.dart';
// import 'package:karta/balance.dart';
// import 'package:karta/main.dart';
import 'package:karta/paymentmethod.dart';

// void main() {
//   runApp(Karta());
// }

class Addbalance extends StatelessWidget {
  const Addbalance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Add Balance",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Jomhuria",
              // fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(height: 80),
            Align(
              alignment: Alignment(-0.7, 1),
              child: Text(
                "Amount",
                style: TextStyle(
                  fontFamily: 'Jomhuria',
                  fontSize: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            // SizedBox(
            // height: 1,
            // ),
            Center(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 180,
                width: 280,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    // labelText: "Phone Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    // prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
            ),
            SizedBox(height: 150),
            SizedBox(
              height: 65,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A5ACD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
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
                  "Pay - EGP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
