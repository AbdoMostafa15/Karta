import 'package:flutter/material.dart';
import 'package:karta/loginarabic.dart';
// import 'package:karta/main.dart';

// void main() {
// runApp(Karta());
// }

class Newpasswordarabic extends StatefulWidget {
  const Newpasswordarabic({super.key});

  @override
  State<Newpasswordarabic> createState() => _NewpasswordarabicState();
}

class _NewpasswordarabicState extends State<Newpasswordarabic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],

        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF6A5ACD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 50),
            Text("إنشاء كلمة سر جديده"),
            SizedBox(height: 150),
            Center(
              child: SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                    ),
                    labelText: "كلمة السر الجديدة",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  labelText: "تأكيد كلمة السر",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                backgroundColor: const Color(0xFF6A5ACD),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                ),
              ),
              onPressed: () {
                // Navigate to verification code page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginarabic()),
                );
              },
              child: const Text(
                "تأكيد",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
