import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  _CompanyProfileScreenState createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  late Box profileBox;
  int _currentIndex = 2;

  String companyName = 'Company Name';
  String email = 'xxx@gmail.com';
  String phoneNumber = '+0000000000';
  String address = 'Somewhere';
  int numberOfEmployees = 0;

  @override
  void initState() {
    super.initState();
    _loadProfileData(); // Load data from Hive
  }

  Future<void> _loadProfileData() async {
    try {
      profileBox = await Hive.openBox('registration_data');
      setState(() {
        companyName =
            profileBox.get('companyName', defaultValue: companyName);
        email = profileBox.get('email', defaultValue: email);
        phoneNumber =
            profileBox.get('phoneNumber', defaultValue: phoneNumber);
        address = profileBox.get('address', defaultValue: address);
        numberOfEmployees =
            profileBox.get('numberOfEmployees', defaultValue: numberOfEmployees);
      });
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Company Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Settings button logic
            },
            icon: const Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture and Name
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue[100],
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.blue[700],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.edit,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              companyName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'HR Manager',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),

            // Profile Details
            _buildProfileField(
              label: 'Company Email',
              value: email,
              icon: Icons.email,
            ),
            const SizedBox(height: 16),
            _buildProfileField(
              label: 'Phone Number',
              value: phoneNumber,
              icon: Icons.phone,
            ),
            const SizedBox(height: 16),
            _buildProfileField(
              label: 'Company Address',
              value: address,
              icon: Icons.location_on,
            ),
            const SizedBox(height: 16),
            _buildProfileField(
              label: 'Number of Employees',
              value: numberOfEmployees.toString(),
              icon: Icons.people,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/management');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Widget to build a profile field
  Widget _buildProfileField({
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 12),
        Expanded(
          child: TextFormField(
            initialValue: value,
            readOnly: true, // Make the field read-only
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.grey),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
