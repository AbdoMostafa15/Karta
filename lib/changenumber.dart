import 'package:flutter/material.dart';
import 'package:karta/personalinfo.dart';
// import 'package:karta/main.dart';
// import 'car.dart';

// void main() {
//   runApp(Karta());
// }

class Changenumber extends StatelessWidget {
  const Changenumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: const Color(0xFF6A5ACD),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("New Number", style: TextStyle()),
              // SizedBox(height: 10),
              TextField(
                controller: null,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "New Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Text("Code", style: TextStyle()),
              // SizedBox(height: 10),
              TextField(
                controller: null,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "Code",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Personalinfo()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A5ACD),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                    ),
                  ),
                  child: const Text(
                    "confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
