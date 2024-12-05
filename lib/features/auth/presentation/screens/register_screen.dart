import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DemoZ Payroll',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.blue),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register your company to continue',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            _buildInputField(context, 'Company name', CompanyNameChanged.new),
            _buildInputField(context, 'Address of the company', AddressChanged.new),
            _buildInputField(context, 'Phone Number', PhoneNumberChanged.new),
            _buildInputField(context, 'Tin Number', TinNumberChanged.new),
            _buildInputField(context, 'Number of employees', NumberOfEmployeesChanged.new),
            _buildInputField(context, 'Company bank', CompanyBankChanged.new),
            _buildInputField(context, 'Bank account number', BankAccountNumberChanged.new),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<RegisterBloc>().add(SubmitRegisterForm());
                  print("Navigating to /home");
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('Submit for approval'),
              )
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(BuildContext context, String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        onChanged: (value) => context.read<RegisterBloc>().add(onChanged(value)),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
