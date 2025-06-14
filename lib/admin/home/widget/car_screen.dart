import 'package:flutter/material.dart';

class CarHistoryScreen extends StatefulWidget {
  const CarHistoryScreen({super.key});

  @override
  State<CarHistoryScreen> createState() => _CarHistoryScreenState();
}

class _CarHistoryScreenState extends State<CarHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> records = [
    {'time': '12:25 p.m', 'amount': '10 EP'},
    {'time': '12:27 p.m', 'amount': '10 EP'},
    {'time': '12:30 p.m', 'amount': '10 EP'},
    {'time': '1:02 p.m', 'amount': '10 EP'},
    {'time': '1:03 p.m', 'amount': '10 EP'},
    {'time': '1:05 p.m', 'amount': '10 EP'},
    {'time': '1:10 p.m', 'amount': '10 EP'},
    {'time': '1:12 p.m', 'amount': '10 EP'},
    {'time': '1:15 p.m', 'amount': '10 EP'},
    {'time': '1:25 p.m', 'amount': '10 EP'},
  ];

  final List<Map<String, dynamic>> totals = [
    {'date': '9\\9\\2024', 'cars': 50, 'price': 10},
    {'date': '10\\9\\2024', 'cars': 67, 'price': 10},
    {'date': '11\\9\\2024', 'cars': 89, 'price': 10},
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
            decoration: BoxDecoration(
              color: Color(0xFF6D5DF6),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                SizedBox(width: 10),
                Text(
                  'Car',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.refresh, color: Colors.white),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: 'Record'),
                Tab(text: 'Total'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Record Tab
                ListView.builder(
                  itemCount: records.length,
                  itemBuilder: (context, index) {
                    final record = records[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.directions_car, color: Colors.blue),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                record['time']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Collected ${record['amount']}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
                // Total Tab
                ListView.builder(
                  itemCount: totals.length,
                  itemBuilder: (context, index) {
                    final total = totals[index];
                    int collection = total['cars'] * total['price'];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            total['date'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Number of cars: ${total['cars']}'),
                          Text('Card price: ${total['price']}'),
                          Text('Total collection: $collection'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Icon(Icons.add, color: Colors.grey),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
