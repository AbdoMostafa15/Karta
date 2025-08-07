import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Accoutinfo extends StatefulWidget {
  const Accoutinfo({super.key});

  @override
  State<Accoutinfo> createState() => _AccoutinfoState();
}

class _AccoutinfoState extends State<Accoutinfo> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller4;

  String text = ''; //name
  String text2 = ''; //e-mail
  String text3 = ''; // Gender
  String text4 = ''; //birthdate

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller4 = TextEditingController();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      final data = doc.data();
      setState(() {
        text = "${data?['first_name'] ?? ''} ${data?['last_name'] ?? ''}";
        text2 = data?['email'] ?? '';
        text3 = data?['gender'] ?? '';
        text4 = data?['birthdate'] ?? '';
      });
    }
  }

  Future<void> _saveUserData(String key, String value) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        key: value,
      });
    }
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller4.dispose();
    super.dispose();
  }

  void buildSection(BuildContext context, String title, int sectionNumber) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        Widget content;

        switch (sectionNumber) {
          case 3:
            content = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: text3 == 'Male',
                      onChanged: (val) {
                        setState(() => text3 = 'Male');
                        _saveUserData('gender', 'Male');
                        Navigator.pop(context);
                      },
                    ),
                    const Text('Male'),
                    const SizedBox(width: 80),
                    Checkbox(
                      value: text3 == 'Female',
                      onChanged: (val) {
                        setState(() => text3 = 'Female');
                        _saveUserData('gender', 'Female');
                        Navigator.pop(context);
                      },
                    ),
                    const Text('Female'),
                  ],
                ),
              ],
            );
          case 4:
            controller4.text = text4;
            content = buildTextFieldModal(controller4, (value) {
              setState(() => text4 = value);
              _saveUserData('birthdate', value);
            });
            break;
          default:
            content = const Text("Editing not allowed for this field.");
        }

        return Padding(padding: const EdgeInsets.all(16), child: content);
      },
    );
  }

  Widget buildGenderModal() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text("Select Gender", style: TextStyle(fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: text3 == "Male",
                    onChanged: (val) {
                      setState(() => text3 = "Male");
                      _saveUserData('gender', "Male");
                      Navigator.pop(context);
                    },
                  ),
                  const Text("Male"),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: text3 == "Female",
                    onChanged: (val) {
                      setState(() => text3 = "Female");
                      _saveUserData('gender', "Female");
                      Navigator.pop(context);
                    },
                  ),
                  const Text("Female"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextFieldModal(
    TextEditingController controller,
    Function(String) onSubmit,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(controller: controller),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              onSubmit(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Submit', style: TextStyle(fontSize: 30)),
          ),
        ),
      ],
    );
  }

  Widget buildInfoSection(
    BuildContext context,
    Widget title,
    int sectionNumber,
  ) {
    return GestureDetector(
      onTap: () => buildSection(context, "Section", sectionNumber),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xff6a5acd),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Name", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(text),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("E-Mail", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(text2),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(text3),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Date Of Birth",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(text4),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Account Info"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
          ),
          child: Column(
            children: List.generate(titles.length, (index) {
              return Column(
                children: [
                  buildInfoSection(context, titles[index], index + 1),
                  if (index != titles.length - 1) const Divider(height: 1),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
