// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:karta/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => SignupState();
}

// Save user data to Firestore
Future<void> saveUserData(
  String firstName,
  String lastName,
  String email,
) async {
  final uid = FirebaseAuth.instance.currentUser!.uid;

  await FirebaseFirestore.instance.collection('users').doc(uid).set({
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
  });
}

class SignupState extends State<Signup> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signup() async {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (!RegExp(
      r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$",
    ).hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email address")),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      await saveUserData(
        firstNameController.text.trim(),
        lastNameController.text.trim(),
        emailController.text.trim(),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Loginpage()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "An error occurred. Please try again.";
      if (e.code == 'weak-password') {
        message = "The password is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = "The account already exists for that email.";
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextField(
                controller: firstNameController,
                label: "First Name",
                icon: Icons.person,
              ),
              buildTextField(
                controller: lastNameController,
                label: "Last Name",
                icon: Icons.person,
              ),
              buildTextField(
                controller: phoneController,
                label: "Phone Number",
                icon: Icons.phone,
              ),
              buildTextField(
                controller: emailController,
                label: "Email",
                icon: Icons.email,
              ),
              buildTextField(
                controller: passwordController,
                label: "Password",
                icon: Icons.lock,
                isObscure: true,
              ),
              buildTextField(
                controller: confirmPasswordController,
                label: "Confirm Password",
                icon: Icons.lock,
                isObscure: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                  backgroundColor: const Color(0xFF6A5ACD),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                  ),
                ),
                onPressed: signup,
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isObscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        height: 50,
        width: 300,
        child: TextField(
          controller: controller,
          obscureText: isObscure,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6A5ACD)),
            ),
            labelText: label,
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
