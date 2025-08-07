import 'package:flutter/material.dart';
import 'package:karta/accountinfoarabic.dart';
import 'package:karta/accountsettingarabic.dart';
import 'package:karta/addvehiclearabic.dart';
import 'package:karta/adminloginarabic.dart';
import 'package:karta/changenumberarabic.dart';
import 'package:karta/mainarabic.dart';

class Personalinfoarabic extends StatelessWidget {
  const Personalinfoarabic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color(0xff615acd),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(height: 25),
              SizedBox(
                height: 35,
                width: 180,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Accoutinfoarabic(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
                        child: const Text(
                          "المعلومات الشخصية",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                height: 150,
                width: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xff6a5acd), width: 2),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "مؤخرا",
                          style: TextStyle(
                            decorationThickness: 2,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                            fontFamily: "Jumhoria",
                            color: Color(0xff6a5acd),
                          ),
                        ),
                      ),
                      // SizedBox(height: 2),
                      Text('17/6/2025                3:35 AM'),
                      SizedBox(height: 5),
                      Text('سيارة                      م ن ا 5 2 4'),
                      SizedBox(height: 5),
                      Text('تم خصم 10 ج.م من كارتة السويس'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Changenumberarabic(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(color: Color(0xff6a5acd), width: 2),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "تغيير الرقم",
                        style: const TextStyle(
                          color: Color(0xff6a5acd),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addvehiclearabic(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(color: Color(0xff6a5acd), width: 2),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "إضافة سيارة",
                        style: const TextStyle(
                          color: Color(0xff6a5acd),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountSettingsScreenarabic(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(color: Color(0xff6a5acd), width: 2),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "إعدادات الحساب",
                        style: const TextStyle(
                          color: Color(0xff6a5acd),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Adminloginarabic(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(color: Color(0xff6a5acd), width: 2),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "المسؤول",
                        style: const TextStyle(
                          color: Color(0xff6a5acd),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homearabic()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        side: BorderSide(color: Color(0xff6a5acd), width: 2),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "تسجيل خروج",
                        style: const TextStyle(
                          color: Color(0xff6a5acd),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
