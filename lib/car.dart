import 'package:flutter/material.dart';
import 'package:karta/accountsettings.dart';
import 'package:karta/balance.dart';
import 'package:karta/home.dart';
// import 'package:karta/main.dart';
import 'addvehicle.dart';

// void main() {
//   runApp(Karta());
// }

class Car extends StatelessWidget {
  const Car({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "vehicles",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jomhuria',
            ),
          ),
          toolbarHeight: 70,
          backgroundColor: Color(0xff6a5acd),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(250, 50),
                  side: BorderSide(color: Color(0xff6a5acd)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  "م ص ر 6 0 3",
                  style: TextStyle(
                    fontFamily: 'Jomhuria',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Color(0xff6a5acd)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addvehicle()),
                  );
                },
                child: Text(
                  "Add Vehicle",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Jomhuria',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color(0xff6a5acd),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text(
                  "Ok",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Jomhuria',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
                MaterialPageRoute(
                  builder: (context) => AccountSettingsScreen(),
                ),
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
