import 'package:flutter/material.dart';
import 'package:karta/bankpaymentarabic.dart';

class Addnewcardarabic extends StatelessWidget {
  const Addnewcardarabic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Text("أضف بطاقة جديده"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 160),
              child: const Text(
                "اسم صاحب البطاقة",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: 145,
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "الاسم الاول",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: "الاسم الثاني",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.only(right: 175),
              child: const Text("رقم البطافه", style: TextStyle(fontSize: 30)),
            ),
            // const SizedBox(height: 5),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "رقم البطاقه",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.only(right: 190),
              child: Text("تاريخ إنتهاء البطاقه"),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "تاريخ إنتهاء البطاقة",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 60),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bankpaymentarabic(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A5ACD),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                child: const Text(
                  "حفظ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
