import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../widgets/dynamic_pie_chart.dart'; // Import the pie chart widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int numberOfEmployees = 0; // Default value

  @override
  void initState() {
    super.initState();
    _loadDataFromHive(); // Load data from Hive
  }

  // Load data from Hive
  Future<void> _loadDataFromHive() async {
    var box = await Hive.openBox('registration_data');
    setState(() {
      numberOfEmployees = box.get('numberOfEmployees', defaultValue: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    // Top Info Cards
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    _buildInfoCard('Number of Employees', '$numberOfEmployees',
    Colors.blue[50], Colors.blue),
    _buildInfoCard(
    'Income Tax Paid', '2000', Colors.green[50], Colors.green),
    ],
    ),
    const SizedBox(height: 10),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    _buildInfoCard('Pension Tax Paid', '4', Colors.teal[50],
    Colors.teal),
    _buildInfoCard(
    'Employees Performance', '95 %', Colors.red[50], Colors.red),
    ],
    ),
    const SizedBox(height: 20),

    // Tabs Section
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    _buildTabButton('Upcoming', isSelected: true),
    _buildTabButton('Past', isSelected: false),
    ],
    ),
    const SizedBox(height: 20),


    // Date Section
    Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    ),
    elevation: 4,
    child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
    Text(
    'Date',
    style: TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16),
    ),
    SizedBox(height: 4),
    Text(
    'Aug 28, 2024 - Sep 5, 2024',
    style: TextStyle(color: Colors.grey),
    ),
    ],
    ),
    ElevatedButton(
    onPressed: () {
    // Pay Now logic
    },
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red[100],
    foregroundColor: Colors.red,
    ),
    child: const Text('Pay Now'),
    ),
    ],
    ),
    const Divider(height: 20, color: Colors.grey),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Text('Income Tax',
    style: TextStyle(color: Colors.grey)),
    Text('4000 etb',
    style: TextStyle(fontWeight: FontWeight.bold)),
    ],
    ),
    const SizedBox(height: 8),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Text('Pension Tax',
    style: TextStyle(color: Colors.grey)),
    Text('5000 etb',
    style: TextStyle(fontWeight: FontWeight.bold)),
    ],
    ),
    const SizedBox(height: 8),
    const Text(
    'August Tax on Due',
    style: TextStyle(
    color: Colors.red, fontWeight: FontWeight.bold),
    ),
    ],
    ),
    ),
    ),
    const SizedBox(height: 20),


      // Bottom Graph Cards (Swapped Positions)
      Row(
        children: [
          Expanded(
            child: _buildGraphCard(
              title: 'Employee Composition',
              content: EmployeeComposition(
                maleEmployees: 65,
                femaleEmployees: 35,
              ), // Embedding the pie chart here
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _buildGraphCard(
              title: 'Tax Summary',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '9,349.85 etb',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '49.98% increase',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
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
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }

  // Info Card Builder
  Widget _buildInfoCard(
      String title, String value, Color? bgColor, Color textColor) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.43,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // Tab Button Builder
  Widget _buildTabButton(String label, {required bool isSelected}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }


  // Graph Card Builder
  Widget _buildGraphCard({required String title, required Widget content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            content,
          ],
        ),
      ),
    );
  }
}
