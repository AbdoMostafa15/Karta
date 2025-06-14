import 'package:flutter/material.dart';

class Reciept extends StatelessWidget {
  const Reciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Text("Reciept"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child: Image(image: AssetImage("images/done.png")),
            ),
            Text("10 EGP", style: TextStyle(fontSize: 35)),
            Text(
              "Payment Completed",
              style: TextStyle(color: Color(0xff6a5acd)),
            ),
            Text("Karta Balance Recharge"),
          ],
        ),
      ),
    );
  }
}
