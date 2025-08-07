import 'package:flutter/material.dart';
import 'package:karta/mainarabic.dart';

class Recieptarabic extends StatelessWidget {
  const Recieptarabic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Text("استلام"),
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
            Text("تم الدفع بنجاح", style: TextStyle(color: Color(0xff6a5acd))),
            Text("شحن حساب كارته"),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homearabic()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A5ACD),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                child: Text(
                  "تأكيد",
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
