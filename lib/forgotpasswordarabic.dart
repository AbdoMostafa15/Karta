import 'package:flutter/material.dart';
import 'package:karta/codearabic.dart';
import 'package:karta/loginarabic.dart';

class Forgotpasswordarabic extends StatelessWidget {
  const Forgotpasswordarabic({super.key});

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
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Center(
            child: Text(
              "هل نسيت كلمة السر؟",
              style: TextStyle(
                color: Color(0xFF6A5ACD),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 220),
          const Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  labelText: "رقم الهاتف",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(250, 50),
              backgroundColor: const Color(0xFF6A5ACD),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Codearabic()),
              );
            },
            child: const Text(
              "تأكيد",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          //const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Loginarabic()),
              );
            },
            child: const Text(
              "العودة لشاشة التسجيل",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF6A5ACD),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
