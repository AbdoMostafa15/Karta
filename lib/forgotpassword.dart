import 'package:flutter/material.dart';
import 'package:karta/code.dart';
import 'package:karta/loginpage.dart';
// import 'package:karta/main.dart';

// void main() {
// runApp(const Karta());
// }

// ignore: camel_case_types
class forgotpassword extends StatelessWidget {
  const forgotpassword({super.key});

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
              "Forgot Password?",
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
                  labelText: "Phone Number",
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
                MaterialPageRoute(builder: (context) => const Code()),
              );
            },
            child: const Text(
              "Confirm",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          //const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Loginpage()),
              );
            },
            child: const Text(
              "Back to Login",
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
