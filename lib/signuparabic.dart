// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:karta/loginarabic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signuparabic extends StatefulWidget {
  const Signuparabic({super.key});

  @override
  State<Signuparabic> createState() => SignuparabicState();
}

class SignuparabicState extends State<Signuparabic> {
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("برجاء ملئ البيانات")));
      return;
    }

    if (!RegExp(
      r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$",
    ).hasMatch(emailController.text)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("برجاء ادخال حساب ")));
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("كلمة السر غير متطابقة")));
      return;
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      // Save full name and email to Firestore
      String uid = userCredential.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': '${firstNameController.text} ${lastNameController.text}',
        'email': emailController.text,
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Loginarabic()),
      );
    } on FirebaseAuthException catch (e) {
      String message = "حدث خطأ. حاول مرة أخرى.";
      if (e.code == 'weak-password') {
        message = "كلمة السر ضعيفة.";
      } else if (e.code == 'email-already-in-use') {
        message = "يوجد حساب مسجل بهذا البريد.";
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
                label: "الاسم الاول",
                icon: Icons.person,
              ),
              buildTextField(
                controller: lastNameController,
                label: "الاسم الثاني",
                icon: Icons.person,
              ),
              buildTextField(
                controller: phoneController,
                label: "رقم الهاتف",
                icon: Icons.phone,
              ),
              buildTextField(
                controller: emailController,
                label: "الحساب",
                icon: Icons.email,
              ),
              buildTextField(
                controller: passwordController,
                label: "كلمة السر",
                icon: Icons.lock,
                isObscure: true,
              ),
              buildTextField(
                controller: confirmPasswordController,
                label: "كلمةالسر",
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
                  "إنشاء حساب",
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
