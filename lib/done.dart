import 'package:flutter/material.dart';
import 'package:karta/home.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Column(
        children: [
          SizedBox(height: 270),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Text("Payment Successful"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Image(image: AssetImage("images/donne.png")),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:karta/home.dart';

// class Done extends StatelessWidget {
//   const Done({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 270),
//           Padding(
//             padding: const EdgeInsets.only(left: 100),
//             child: Text("Payment Successful"),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 100),
//             child: Image(image: AssetImage("images/donne.png")),
//           ),
//         ],
//       ),
//     );
//   }
// }
