import 'package:flutter/material.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF6D5DF6),
        elevation: 0,
        title: Text(
          'User management',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.blueAccent),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // User Cards
              _buildUserCard(
                name: 'Mohammed ahmed',
                carNumber: '٩٧٨٦',
                email: 'Moahmed22@gmail.com',
              ),
              SizedBox(height: 20),
              _buildUserCard(
                name: 'Alaa hussein',
                carNumber: '٦٦٦٦',
                email: 'Alhussein66@gmail.com',
              ),
              SizedBox(height: 20),

              // Add User Section
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6D5DF6),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add User',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 12),

              // Add User Form
              _buildAddUserForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(
      {required String name,
      required String carNumber,
      required String email}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Circle Avatar
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(width: 12),
                // Name and Car
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name : $name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: 8),
                      Text('Car : $carNumber',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text('Gmail : $email'),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.edit, size: 16, color: Color(0xFF6D5DF6)),
                label: Text(
                  'Edit',
                  style: TextStyle(
                    color: Color(0xFF6D5DF6),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddUserForm() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField('Name'),
                      SizedBox(height: 8),
                      _buildInputField('Car'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            _buildInputField('Gmail'),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '+Add',
                  style: TextStyle(
                    color: Color(0xFF6D5DF6),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
