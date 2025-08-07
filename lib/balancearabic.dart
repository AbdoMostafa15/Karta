import 'package:flutter/material.dart';
import 'package:karta/addbalancearabic.dart';
import 'package:karta/cararabic.dart';
import 'package:karta/homearabic.dart';
import 'package:karta/personalinfoarabic.dart';

class Balancearabic extends StatelessWidget {
  const Balancearabic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],

        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xff6a5acd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 280),
              Text(
                "تعذر ايجاد العملية",
                style: TextStyle(
                  fontFamily: 'Jomhuria',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
              // SizedBox(
              // height: 5,
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Addbalancearabic()),
                  );
                },
                child: Text(
                  "اضف رصيد",
                  style: TextStyle(
                    fontFamily: 'Jomhuria',
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff6a5acd),
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 3,
                    color: Color(0xff6a5acd),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF6A5ACD),
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Homearabicqr()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cararabic()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Balancearabic()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Personalinfoarabic()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 28),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car, size: 28),
              label: "السيارة",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, size: 28),
              label: "المحفظة",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28),
              label: "الحساب",
            ),
          ],
        ),
      ),
    );
  }
}
