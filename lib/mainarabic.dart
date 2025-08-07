import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:karta/firebase_options.dart';
import 'package:karta/homearabic.dart';
import 'package:karta/loginarabic.dart';
import 'package:karta/main.dart';
import 'package:karta/signuparabic.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

Future<UserCredential?> signInWithGoogle(BuildContext context) async {
  try {
    // Sign out to force the account picker
    await GoogleSignIn().signOut();

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      // User cancelled the picker
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    // Show success message
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح')));

    // Navigate to Home screen
    Navigator.pushReplacement(
      context,

      MaterialPageRoute(builder: (context) => const Homearabicqr()),
    );

    return userCredential;
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('تعذر تسجيل الدخول: $e')));
    return null;
  }
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

class Homearabic extends StatefulWidget {
  const Homearabic({super.key});

  @override
  State<Homearabic> createState() => HomearabicState();
}

class HomearabicState extends State<Homearabic> {
  String selectedLanguage = "العربية";

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("images/logo.png", height: 100),
            const SizedBox(height: 30),
            buildButton("تسجيل دخول", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Loginarabic()),
              );
            }),
            const SizedBox(height: 30),
            buildButton("إنشاء حساب", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Signuparabic()),
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
                  "او",
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
                onPressed: () async {
                  await signInWithGoogle(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.g_mobiledata,
                      color: Color(0xFF6A5ACD),
                      size: 35,
                    ),
                    Text(
                      "تسجيل الدخول بإستخدام جوجل",
                      style: TextStyle(color: Color(0xFF6A5ACD), fontSize: 24),
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

                // Navigate to the appropriate screen
                if (newValue == "العربية") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Homearabic()),
                  );
                } else if (newValue == "English") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                }
              },
              itemBuilder:
                  (BuildContext context) => const [
                    PopupMenuItem(value: "العربية", child: Text("العربية")),
                    PopupMenuItem(value: "English", child: Text("English")),
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
