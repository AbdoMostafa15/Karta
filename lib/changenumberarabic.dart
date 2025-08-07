import 'package:flutter/material.dart';
import 'package:karta/personalinfoarabic.dart';

class Changenumberarabic extends StatelessWidget {
  const Changenumberarabic({super.key});

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
              Text("الرقم الجديد", style: TextStyle()),
              // SizedBox(height: 10),
              TextField(
                controller: null,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "الرقم الجديد",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),
              Text("الرمز", style: TextStyle()),
              // SizedBox(height: 10),
              TextField(
                controller: null,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "الرمز",
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
                      MaterialPageRoute(
                        builder: (context) => Personalinfoarabic(),
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
                    "تأكيد",
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
