import 'package:flutter/material.dart';
import 'package:karta/changepassword.dart';
import 'package:karta/home.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Center(
                child: Row(children: [Icon(Icons.warning, size: 40)]),
              ),
            ),
            Center(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel', style: TextStyle(fontSize: 30)),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const Changepassword(),
                    //   ),
                    // );
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
