import 'package:flutter/material.dart';
import 'package:karta/done.dart';

class Teldaarabic extends StatelessWidget {
  const Teldaarabic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(toolbarHeight: 70, backgroundColor: Colors.white),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text("Telda", style: TextStyle(fontSize: 55)),
              SizedBox(width: 80),
              SizedBox(
                height: 150,
                width: 150,
                child: Image(image: AssetImage("images/telda.png")),
              ),
            ],
          ),
          Text("تأكيد الدفع"),
          Text("تم ارسال رسالة بالكود"),
          Text("الرقم المسجل ينتهي بتاريخ ****6"),
          Text("10 تم دفع مبلغ "),
          Text("جنيه بتاريخ 1/1/2025"),
          Text("لديك ثلاث محاولات لادخال كلمة السر و اعاده الارسال"),
          Text("لديك ثلاث محاولات لادخال كلمة السر"),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff6a5acd),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Done()),
                );
              },
              child: Text("تأكيد", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
