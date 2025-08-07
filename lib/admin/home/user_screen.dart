import 'package:flutter/material.dart';
import 'package:karta/admin/home/widget/user_man_widget.dart';
// import 'package:karta/features/admin/home/widget/user_man_widget.dart';

class UserManagementCashScreen extends StatelessWidget {
  const UserManagementCashScreen({super.key});

  final List<Map<String, String>> users = const [
    {'name': 'Alaa hussein', 'car': 'ب ب ب/1234'},
    {'name': 'omar ali', 'car': 'ت ت ت/2222'},
    {'name': 'aml khaled', 'car': 'ث ث ث/3333'},
    {'name': 'shoruk mo', 'car': 'ج ج ج/4444'},
    {'name': 'mai omar', 'car': 'ح ح ح/5555'},
    {'name': 'Amar wael', 'car': 'د د د/6666'},
    {'name': 'Asem hussein', 'car': 'ر ر ر/7777'},
    {'name': 'Alaa mohamed', 'car': 'ب ب ب/8888'},
    {'name': 'Alaa hussein', 'car': 'ب ب ب/9999'},
    {'name': 'Alaa hussein', 'car': 'ب ب ب/1234'},
    {'name': 'Alaa hussein', 'car': 'ب ب ب/1234'},
    {'name': 'Alaa hussein', 'car': 'ب ب ب/1234'},
    {'name': 'Alaa hussein', 'car': 'ب ب ب/1234'},
    {'name': 'Alaa hussein', 'car': 'ب ب ب/1234'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF6D5DF6),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'User management cash',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Car',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserManagementScreen(),
                              ),
                            );
                          },
                          child: Text(
                            user['name']!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              decoration:
                                  TextDecoration
                                      .underline, // عشان يبين إنه ممكن يتضغط عليه
                            ),
                          ),
                        ),
                      ),
                      Text(user['car']!, style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Icon(Icons.clear, color: Colors.red),
                      SizedBox(width: 4),
                      Icon(Icons.check_circle, color: Colors.green),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
