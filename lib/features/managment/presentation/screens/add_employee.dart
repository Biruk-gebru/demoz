import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  final TextEditingController _grossSalaryController = TextEditingController();
  final TextEditingController _taxableEarningsController =
  TextEditingController();
  final TextEditingController _startDateController = TextEditingController();

  String _salaryType = "per month";

  void _addEmployee() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _tinController.text.isNotEmpty &&
        _grossSalaryController.text.isNotEmpty &&
        _taxableEarningsController.text.isNotEmpty &&
        _startDateController.text.isNotEmpty) {
      // Logic to save employee data
      print("Employee Added Successfully");
      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Phone: ${_phoneController.text}");
      print("TIN: ${_tinController.text}");
      print("Gross Salary: ${_grossSalaryController.text}");
      print("Taxable Earnings: ${_taxableEarningsController.text}");
      print("Start Date: ${_startDateController.text}");
      print("Salary Type: $_salaryType");

      // Navigate back after adding the employee
      Navigator.pop(context);
    } else {
      // Show error if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all the fields"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Employee',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Add New Employee",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Here you add your new employee and start calculating their tax and salary",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Form Fields
            _buildTextField(_nameController, "Employee name"),
            const SizedBox(height: 12),
            _buildTextField(_emailController, "Email address"),
            const SizedBox(height: 12),
            _buildTextField(_phoneController, "Phone number"),
            const SizedBox(height: 12),
            _buildTextField(_tinController, "Tin number"),
            const SizedBox(height: 12),
            _buildTextField(_grossSalaryController, "Gross salary"),
            const SizedBox(height: 12),
            _buildTextField(_taxableEarningsController, "Taxable earnings"),
            const SizedBox(height: 12),
            _buildTextField(_startDateController, "Starting date of salary",
                keyboardType: TextInputType.datetime),
            const SizedBox(height: 20),

            // Salary Type Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSalaryTypeButton("per month"),
                _buildSalaryTypeButton("per Contract"),
              ],
            ),
            const SizedBox(height: 30),

            // Add Employee Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addEmployee,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Add Employee",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text Field Builder
  Widget _buildTextField(
      TextEditingController controller,
      String hintText, {
        TextInputType keyboardType = TextInputType.text,
      }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      ),
    );
  }

  // Salary Type Button Builder
  Widget _buildSalaryTypeButton(String type) {
    final isSelected = _salaryType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _salaryType = type;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
