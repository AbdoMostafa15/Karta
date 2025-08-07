import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:karta/home.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
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
                child: Text("Old Password", style: TextStyle(fontSize: 30)),
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
                    hintText: "Enter old password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Padding(
                padding: EdgeInsets.only(right: 170),
                child: Text("New Password", style: TextStyle(fontSize: 30)),
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
                    hintText: "Enter new password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(right: 140),
                child: Text("Confirm Password", style: TextStyle(fontSize: 30)),
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
                    hintText: "Re-enter new password",
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
                    "Confirm",
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
