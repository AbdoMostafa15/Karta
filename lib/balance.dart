import 'package:flutter/material.dart';
import 'package:karta/personalinfo.dart';
import 'package:karta/addbalance.dart';
import 'package:karta/car.dart';
import 'package:karta/home.dart';
// import 'package:karta/main.dart';

// void main() {
// runApp(Karta());
// }

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                "No Transaction Found",
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
                    MaterialPageRoute(builder: (context) => Addbalance()),
                  );
                },
                child: Text(
                  "Add Balance",
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
                MaterialPageRoute(builder: (context) => Home()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Car()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Balance()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Personalinfo()),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 28),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car, size: 28),
              label: "Car",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, size: 28),
              label: "Wallet",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 28),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
