import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:karta/firebase_options.dart';
import 'package:karta/loginpage.dart';
import 'package:karta/signup.dart';
import 'package:karta/signingoogle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint('Flutter error: ${details.exception}');
    debugPrint('Stack trace: ${details.stack}');
  };

  runApp(const Karta());
}

class Karta extends StatelessWidget {
  const Karta({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Jomhuria',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(fontSize: 24),
          bodySmall: TextStyle(fontSize: 20),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A5ACD),
        toolbarHeight: 70,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("images/Screenshot 2025-04-28 134426.png", height: 100),
            const SizedBox(height: 30),
            buildButton("Log in", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Loginpage()),
              );
            }),
            const SizedBox(height: 30),
            buildButton("Sign Up", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Signup()),
              );
            }),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    indent: 30,
                    endIndent: 15,
                    thickness: 3,
                    color: Color(0xFF6A5ACD),
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Divider(
                    indent: 15,
                    endIndent: 30,
                    thickness: 3,
                    color: Color(0xFF6A5ACD),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signingoogle(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Sign in with Google",
                      style: TextStyle(color: Color(0xFF6A5ACD), fontSize: 24),
                    ),
                    Icon(
                      Icons.g_mobiledata,
                      color: Color(0xFF6A5ACD),
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            PopupMenuButton<String>(
              onSelected: (String newValue) {
                setState(() {
                  selectedLanguage = newValue;
                });
              },
              itemBuilder:
                  (BuildContext context) => [
                    const PopupMenuItem(
                      value: "العربية",
                      child: Text("العربية"),
                    ),
                    const PopupMenuItem(
                      value: "English",
                      child: Text("English"),
                    ),
                  ],
              child: Text(
                selectedLanguage,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6A5ACD),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
