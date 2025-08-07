import 'package:flutter/material.dart';
import 'package:karta/admin/home/widget/custom_drawer_arabic.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreenarabic extends StatefulWidget {
  const WelcomeScreenarabic({super.key});

  @override
  State<WelcomeScreenarabic> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreenarabic> {
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
      drawer: CustomDrawerArabic(),
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
          'مرحبا',
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
                          'العمليات',
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
                                    'بطاقة بنكية',
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
                                    'بطاقة الكترونية',
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
                          'المستخدم',
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
                            Text('نشط'),
                            SizedBox(width: 16),
                            Icon(Icons.circle, color: Colors.grey, size: 12),
                            SizedBox(width: 8),
                            Text('غير نشط'),
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
                          'خط السير',
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
                          child: Center(child: Text('بياني خط السير')),
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
                            'تاريخ المعاملات:',
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
