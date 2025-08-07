import 'package:flutter/material.dart';
import 'package:karta/done.dart';

class Telda extends StatelessWidget {
  const Telda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(toolbarHeight: 70, backgroundColor: Colors.white),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30),
              Text("Telda", style: TextStyle(fontSize: 55)),
              SizedBox(width: 80),
              SizedBox(
                height: 150,
                width: 150,
                child: Image(image: AssetImage("images/telda.png")),
              ),
            ],
          ),
          Text("payment Authentication"),
          Text("We have sent you a text massege with a code to your"),
          Text("registered mobile number ending in *****666"),
          Text("You are paying to  karta the amount of 10.00 Egyptian"),
          Text("pound on 1/1/2025"),
          Text("You have 3 attempts to enter password and 3 to Resend"),
          Text("You have 3 attempts to enter password and 3 to"),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff6a5acd),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Done()),
                );
              },
              child: Text("Submit", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
