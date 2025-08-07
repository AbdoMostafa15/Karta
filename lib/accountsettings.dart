import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karta/changepassword.dart';
import 'homearabic.dart';
import 'package:karta/home.dart';
import 'package:karta/main.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  void deleteAccountAndRestartApp(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.delete();

        // After successful deletion, navigate to main screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Karta()),
          (route) => false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          // Sign out the user if deletion fails due to auth timeout
          await FirebaseAuth.instance.signOut();

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Karta()),
            (route) => false,
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Session expired. Please log in again."),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to delete account: ${e.message}")),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Account Settings',
          style: TextStyle(fontFamily: 'Jomhuria'),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: 300,
          width: 300,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ListView(
              children: [
                _buildSettingsItem(
                  context,
                  title: 'Change password',
                  icon: Icons.lock,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Changepassword(),
                      ),
                    );
                  },
                ),
                const Divider(),
                _buildSettingsItem(
                  context,
                  title: 'Language',
                  icon: Icons.language,
                  onTap: () {
                    languagedialog(context);
                  },
                ),
                const Divider(),
                _buildSettingsItem(
                  context,
                  title: 'Delete Account',
                  icon: Icons.delete_forever,
                  textColor: Colors.red,
                  onTap: () {
                    _showDeleteAccountDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    Color textColor = Colors.black,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor),
      title: Text(title, style: TextStyle(fontSize: 18, color: textColor)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      onTap: onTap,
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('Delete your Account?')),
          actions: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 75, bottom: 20),
                  child: Icon(Icons.warning, size: 80),
                ),
              ],
            ),
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => deleteAccountAndRestartApp(context),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                  SizedBox(width: 29),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel', style: TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  // class ChangePasswordScreen extends StatelessWidget {
  //   const ChangePasswordScreen({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       appBar: AppBar(title: const Text('Change Password')),
  //       body: const Center(child: Text('Change Password Screen')),
  //     );
  //   }
  // }
}

void languagedialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: const Text('Language', style: TextStyle(fontSize: 30)),
        ),
        content: SizedBox(
          height: 90,
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "English",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.black,
                // margin: EdgeInsets.symmetric(vertical: 8),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homearabicqr()),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Arabic",
                      style: TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
