import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CarHistoryScreen extends StatefulWidget {
  const CarHistoryScreen({super.key});

  @override
  State<CarHistoryScreen> createState() => _CarHistoryScreenState();
}

class _CarHistoryScreenState extends State<CarHistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, String>> records = [];
  List<Map<String, dynamic>> totals = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadPaymentHistory();
  }

  Future<void> loadPaymentHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final historyData = prefs.getStringList('payment_history') ?? [];

    List<Map<String, String>> newRecords = [];

    for (String entry in historyData) {
      try {
        final decoded = json.decode(entry);
        if (decoded is Map<String, dynamic>) {
          final vehicle = decoded['vehicle']?.toString() ?? '';
          final timestamp = decoded['timestamp']?.toString() ?? '';
          newRecords.add({'vehicle': vehicle, 'timestamp': timestamp});
        }
      } catch (e) {
        // ignore malformed entries
      }
    }

    if (mounted) {
      setState(() {
        records = newRecords;
      });
    }
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
            padding: const EdgeInsets.only(
              top: 40,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF6D5DF6),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Car',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.refresh, color: Colors.white),
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
              tabs: const [Tab(text: 'Record'), Tab(text: 'Total')],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Record Tab
                records.isEmpty
                    ? const Center(child: Text("No payment history found."))
                    : ListView.builder(
                      itemCount: records.length,
                      itemBuilder: (context, index) {
                        final record = records[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.directions_car,
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    record['vehicle'] ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    record['timestamp'] ?? '',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                // Total Tab (still dummy)
                ListView.builder(
                  itemCount: totals.length,
                  itemBuilder: (context, index) {
                    final total = totals[index];
                    int collection = total['cars'] * total['price'];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            total['date'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
