import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:karta/admin/home/user_screen.dart';
import 'package:karta/admin/home/widget/custom_drawer.dart';

// import 'package:karta/admin/home/widget/car_screen.dart';
// import 'package:karta/core/function/routing.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> paymentHistory = [];

  @override
  void initState() {
    super.initState();
    loadPaymentHistory();
  }

  Future<void> loadPaymentHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      paymentHistory = prefs.getStringList('payment_history') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6D5DF6),
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF6D5DF6),
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Text(
          'welcome',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [],
                    ),
                    SizedBox(height: 24),

                    // Payment section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.white,
                                    child: Center(child: Text('26%')),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Bank card',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.indigo,
                                    child: Center(
                                      child: Text(
                                        '66.3%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'E-Wallet',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.indigo,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // User section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.blue, size: 12),
                            SizedBox(width: 8),
                            Text('Active'),
                            SizedBox(width: 16),
                            Icon(Icons.circle, color: Colors.grey, size: 12),
                            SizedBox(width: 8),
                            Text('Inactive'),
                          ],
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                          minHeight: 8,
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Traffic section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Traffic',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Text('Traffic Chart')),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Dynamic Payment History in Car Icon Section
                    if (paymentHistory.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Text(
                            'Payment History:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                paymentHistory.map((entry) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4.0,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        entry,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
