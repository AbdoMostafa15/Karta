import 'dart:io';
import 'package:flutter/material.dart';
import 'package:karta/balance.dart';
import 'package:karta/car.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'personalinfo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6A5ACD),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 12,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "KARTA",
                        style: TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A5ACD),
                          letterSpacing: 30,
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF6A5ACD),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 142,
                          width: 142,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: QRView(
                              key: qrKey,
                              onQRViewCreated: onQRViewCreated,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A5ACD),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 12,
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Scan QR",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
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
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Car()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Balance()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Personalinfo()),
              );
              break;
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
    );
  }

  void onQRViewCreated(QRViewController ctrl) {
    controller = ctrl;
    controller!.scannedDataStream.listen((scanData) {
      if (result == null) {
        setState(() {
          result = scanData;
        });

        controller!.pauseCamera();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Car()),
        );
      }
    });
  }
}
