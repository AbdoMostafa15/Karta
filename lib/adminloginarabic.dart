import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karta/forgotpasswordarabic.dart';
import 'admin/home/home_screenarabic.dart';

class Adminloginarabic extends StatefulWidget {
  const Adminloginarabic({super.key});

  @override
  State<Adminloginarabic> createState() => _LoginpagearabicState();
}

class _LoginpagearabicState extends State<Adminloginarabic> {
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
          const SnackBar(content: Text("من فضلك اضف الحساب و كلمة السر")),
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
          MaterialPageRoute(builder: (context) => const WelcomeScreenarabic()),
        );
      } else {
        debugPrint("User is null after login");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("تعذر تسجيل الدخول: المستخدم غير مسجل")),
        );
      }
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? "حدث خطأ اثناء تسجيل الدخول";
      debugPrint('FirebaseAuthException: $message');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e, stackTrace) {
      debugPrint('خطأ غير معروف: $e');
      debugPrint('StackTrace: $stackTrace');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('خطأ غير متوقع: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.blue,
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
                    builder: (context) => const Forgotpasswordarabic(),
                  ),
                );
              },
              child: const Text(
                "نسيت كلمة السر؟",
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
                  //   MaterialPageRoute(
                  //     builder: (context) => const WelcomeScreenarabic(),
                  //   ),
                  // );
                },
                // login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                child: const Text(
                  "تسجيل دخول",
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
