import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Accoutinfoarabic extends StatefulWidget {
  const Accoutinfoarabic({super.key});

  @override
  State<Accoutinfoarabic> createState() => _AccoutinfoarabicState();
}

class _AccoutinfoarabicState extends State<Accoutinfoarabic> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller4;

  String text = '';
  String text2 = '';
  String text3 = ''; // gender
  String text4 = '';

  String firstName = '';
  String lastName = '';

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
      if (data != null) {
        setState(() {
          firstName = data['first_name'] ?? '';
          lastName = data['last_name'] ?? '';
          text = '$firstName $lastName';
          text2 = data['email'] ?? '';
          text3 = data['gender'] ?? '';
          text4 = data['birthdate'] ?? '';
        });
      }
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
          case 1:
            controller1.text = text;
            content = buildTextFieldModal(controller1, (value) async {
              final parts = value.trim().split(' ');
              String newFirst = parts.isNotEmpty ? parts.first : '';
              String newLast =
                  parts.length > 1 ? parts.sublist(1).join(' ') : '';
              await _saveUserData('first_name', newFirst);
              await _saveUserData('last_name', newLast);
              setState(() {
                firstName = newFirst;
                lastName = newLast;
                text = '$newFirst $newLast';
              });
            });
            break;

          case 2:
            controller2.text = text2;
            content = buildTextFieldModal(controller2, (value) {
              setState(() => text2 = value);
              _saveUserData('email', value);
            });
            break;

          case 3:
            content = Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: text3 == 'ذكر',
                      onChanged: (val) {
                        setState(() => text3 = 'ذكر');
                        _saveUserData('gender', 'ذكر');
                        Navigator.pop(context);
                      },
                    ),
                    const Text('ذكر'),
                    const SizedBox(width: 80),
                    Checkbox(
                      value: text3 == 'أنثى',
                      onChanged: (val) {
                        setState(() => text3 = 'أنثى');
                        _saveUserData('gender', 'أنثى');
                        Navigator.pop(context);
                      },
                    ),
                    const Text('أنثى'),
                  ],
                ),
              ],
            );
            break;

          case 4:
            controller4.text = text4;
            content = buildTextFieldModal(controller4, (value) {
              setState(() => text4 = value);
              _saveUserData('birthdate', value);
            });
            break;

          default:
            content = const Text("لا يوجد محتوي");
        }

        return Padding(padding: const EdgeInsets.all(16), child: content);
      },
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
            child: const Text('تأكيد', style: TextStyle(fontSize: 30)),
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
          const Text("الاسم", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(text),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("الحساب", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(text2),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("النوع", style: TextStyle(fontWeight: FontWeight.bold)),
          Text(text3),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "تاريخ الميلاد",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(text4),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("بيانات الحساب"),
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
