import 'package:flutter/material.dart';

class Addvehicle extends StatelessWidget {
  Addvehicle({super.key});

  final TextEditingController numberController = TextEditingController();
  final TextEditingController lettersController = TextEditingController();

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
              const SizedBox(height: 100),
              const Text("License Plate Number"),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "License plate number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car),
                ),
              ),
              const SizedBox(height: 30),
              const Text("License Plate Letters"),
              TextField(
                controller: lettersController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "License plate letters",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car),
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    String number = numberController.text.trim();
                    String letters = lettersController.text.trim();
                    String vehicleData = '$number $letters';

                    Navigator.pop(context, vehicleData); // Send data back
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A5ACD),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                    ),
                  ),
                  child: const Text(
                    "Add Vehicle",
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
