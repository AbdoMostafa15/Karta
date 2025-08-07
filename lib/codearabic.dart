import 'package:flutter/material.dart';
import 'package:karta/newpasswordarabic.dart';

// void main() {
// runApp(Karta());
// }

class Codearabic extends StatefulWidget {
  const Codearabic({super.key});

  @override
  State<Codearabic> createState() => _CodearabicState();
}

class _CodearabicState extends State<Codearabic> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Jomhuria'),
      home: Scaffold(
        backgroundColor: Colors.grey[100],

        appBar: AppBar(
          backgroundColor: Color(0xFF6A5ACD),
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Text("الكود", style: TextStyle(fontSize: 24)),
              SizedBox(height: 360),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                    ),
                    labelText: "ادخل الكود",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.terminal),
                  ),
                ),
              ),
              SizedBox(height: 10),
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
                    MaterialPageRoute(
                      builder: (context) => Newpasswordarabic(),
                    ),
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
      ),
    );
  }
}
