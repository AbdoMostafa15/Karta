import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karta/forgotpasswordarabic.dart';
import 'package:karta/homearabic.dart';

class Loginarabic extends StatefulWidget {
  const Loginarabic({super.key});

  @override
  State<Loginarabic> createState() => _LoginarabicState();
}

class _LoginarabicState extends State<Loginarabic> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    try {
      final String email = emailController.text.trim().toLowerCase();
      final String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter email and password")),
        );
        return;
      }

      debugPrint("Attempting login for $email");
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = credential.user;

      if (user != null) {
        debugPrint("Login successful for user: ${user.uid}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Homearabicqr()),
        );
      } else {
        debugPrint("User is null after login");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login failed: user not found")),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "Login failed with FirebaseAuthException";
      debugPrint('FirebaseAuthException: $message');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e, stackTrace) {
      debugPrint('Unknown error: $e');
      debugPrint('StackTrace: $stackTrace');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "الحساب",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6A5ACD)),
                  ),
                  hintText: "كلمة السر",
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Forgotpasswordarabic(),
                  ),
                );
              },
              child: const Text(
                "هل نسيت كلمة السر؟",
                style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  login();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Home()),
                  // );
                },
                // login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A5ACD),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                child: const Text(
                  "تسجيل الدخول",
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
    );
  }
}
