import 'package:demoz/features/managment/presentation/screens/add_employee.dart';
import 'package:flutter/material.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;

    // Sample employee data
    final List<Map<String, String>> employees = [
      {
        'name': 'Abraham Welde',
        'netSalary': '15,000',
        'taxableEarnings': '2,000',
        'incomeTax': '5,000',
        'pension': '500',
      },
      {
        'name': 'Bisrat Alemu',
        'netSalary': '25,000',
        'taxableEarnings': '3,000',
        'incomeTax': '7,000',
        'pension': '700',
      },
      {
        'name': 'Bisrate Girum',
        'netSalary': '15,000',
        'taxableEarnings': '2,000',
        'incomeTax': '5,000',
        'pension': '500',
      },
      {
        'name': 'Alemu Molla',
        'netSalary': '15,000',
        'taxableEarnings': '2,000',
        'incomeTax': '5,000',
        'pension': '500',
      },
      {
        'name': 'Abraham Welde',
        'netSalary': '15,000',
        'taxableEarnings': '2,000',
        'incomeTax': '5,000',
        'pension': '500',
      },
      {
        'name': 'Bisrat Alemu',
        'netSalary': '25,000',
        'taxableEarnings': '3,000',
        'incomeTax': '7,000',
        'pension': '700',
      },
      {
        'name': 'Bisrate Girum',
        'netSalary': '15,000',
        'taxableEarnings': '2,000',
        'incomeTax': '5,000',
        'pension': '500',
      },
      {
        'name': 'Alemu Molla',
        'netSalary': '15,000',
        'taxableEarnings': '2,000',
        'incomeTax': '5,000',
        'pension': '500',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Management',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              // Upload CSV logic
            },
            icon: const Icon(Icons.upload_file, color: Colors.black),
            label: const Text(
              'Upload CSV',
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddEmployeeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add Employee'),
          ),

        ],
      ),
      body: Column(
        children: [
          // Table Header
          Container(
            color: Colors.blueAccent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Employees',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Net Salary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Taxable Earnings',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Income Tax',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Pension',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Table Content
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return Container(
                  color: (index % 2 == 0) ? Colors.blue[50] : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(employee['name']!),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(employee['netSalary']!),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(employee['taxableEarnings']!),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(employee['incomeTax']!),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(employee['pension']!),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
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
}
