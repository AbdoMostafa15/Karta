import 'package:flutter/material.dart';
import 'package:karta/addvehiclearabic.dart';
import 'package:karta/balancearabic.dart';
import 'package:karta/homearabic.dart';
import 'package:karta/paymentmethodarabic.dart';
import 'package:karta/personalinfoarabic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cararabic extends StatefulWidget {
  const Cararabic({super.key});

  @override
  State<Cararabic> createState() => _CarState();
}

class _CarState extends State<Cararabic> {
  List<String> vehicles = [];

  @override
  void initState() {
    super.initState();
    _loadVehicles();
  }

  Future<void> _loadVehicles() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      vehicles = prefs.getStringList('vehicles') ?? [];
    });
  }

  Future<void> _addVehicle(String vehicle) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      vehicles.add(vehicle);
    });
    await prefs.setStringList('vehicles', vehicles);
  }

  void _navigateToAddVehicle() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addvehiclearabic()),
    );

    if (result != null && result is String && result.isNotEmpty) {
      await _addVehicle(result);
    }
  }

  Future<void> _saveSelectedVehicle(String plate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_vehicle', plate);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "السيارات",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jomhuria',
            ),
          ),
          toolbarHeight: 70,
          backgroundColor: const Color(0xff6a5acd),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                ...vehicles.map(
                  (plate) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size(250, 50),
                        side: const BorderSide(color: Color(0xff6a5acd)),
                      ),
                      onPressed: () async {
                        await _saveSelectedVehicle(plate);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PaymentMethodarabic(),
                          ),
                        );
                      },
                      child: Text(
                        plate,
                        style: const TextStyle(
                          fontFamily: 'Jomhuria',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(250, 50),
                    side: const BorderSide(color: Color(0xff6a5acd)),
                  ),
                  onPressed: _navigateToAddVehicle,
                  child: const Text(
                    "أضف سيارة",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Jomhuria',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: const Color(0xff6a5acd),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Homearabicqr()),
                    );
                  },
                  child: const Text(
                    "حسنا",
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
                MaterialPageRoute(builder: (_) => const Homearabicqr()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Cararabic()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Balancearabic()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Personalinfoarabic()),
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
              label: "اليطاقة",
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
