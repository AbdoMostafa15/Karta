import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karta/home.dart';

class Changepasswordarabic extends StatefulWidget {
  const Changepasswordarabic({super.key});

  @override
  State<Changepasswordarabic> createState() => _ChangepasswordarabicState();
}

class _ChangepasswordarabicState extends State<Changepasswordarabic> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> changePassword() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('New passwords do not match')),
      );
      return;
    }

    try {
      final email = user.email;
      final credential = EmailAuthProvider.credential(
        email: email!,
        password: oldPassword,
      );

      // Reauthenticate user
      await user.reauthenticateWithCredential(credential);

      // Change password
      await user.updatePassword(newPassword);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Home()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Error changing password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(toolbarHeight: 70, backgroundColor: Colors.white),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 170),
                child: Text(
                  "كلمة السر القديمة",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "ادخل كلمة السر القديمة",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Padding(
                padding: EdgeInsets.only(right: 170),
                child: Text(
                  "كلمة السر الجديده",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "ادخل كلمة السر الجديده",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 140),
                child: Text("تأكيد كلمة السر", style: TextStyle(fontSize: 30)),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "اعد إدخال كلمة السر",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: changePassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A5ACD),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                    ),
                  ),
                  child: const Text(
                    "تأكيد",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
