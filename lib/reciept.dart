import 'package:flutter/material.dart';
import 'package:karta/home.dart';

class Reciept extends StatelessWidget {
  const Reciept({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Text("Reciept"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 80),
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
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A5ACD),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
