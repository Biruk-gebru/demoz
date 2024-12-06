import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../bloc/register_bloc.dart';
import '../bloc/register_event.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  Future<void> _storeDataInHive(Map<String, String> formData) async {
    try {
      final box = await Hive.openBox('registration_data');
      formData.forEach((key, value) {
        box.put(key, value);
      });
    } catch (e) {
      print('Error storing data in Hive: $e');
    }
  }

  bool _isPhoneNumberValid(String phoneNumber) {
    final phoneRegex = RegExp(r'^[0-9]{10}$'); // Example: 10-digit phone number
    return phoneRegex.hasMatch(phoneNumber);
  }

  bool _isTinNumberValid(String tinNumber) {
    final tinRegex = RegExp(r'^[0-9]+$'); // Example: Numeric TIN
    return tinRegex.hasMatch(tinNumber);
  }

  bool _isNumberValid(String number) {
    return int.tryParse(number) != null && int.parse(number) > 0;
  }

  void _onSubmit(BuildContext context, Map<String, String> formData) {
    if (formData['Company name']!.isEmpty ||
        formData['Address of the company']!.isEmpty ||
        !_isPhoneNumberValid(formData['Phone Number']!) ||
        !_isTinNumberValid(formData['Tin Number']!) ||
        !_isNumberValid(formData['Number of employees']!) ||
        formData['Company bank']!.isEmpty ||
        formData['Bank account number']!.isEmpty) {
      _showError(context, 'Please fill out all fields with valid data.');
      return;
    }

    _storeDataInHive(formData);
    context.read<RegisterBloc>().add(SubmitRegisterForm());
    Navigator.pushNamed(context, '/home');
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formData = {
      'Company name': '',
      'Address of the company': '',
      'Phone Number': '',
      'Tin Number': '',
      'Number of employees': '',
      'Company bank': '',
      'Bank account number': '',
    };

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
            _buildInputField(
              context,
              label: 'Company name',
              onChanged: (value) {
                formData['Company name'] = value;
                context.read<RegisterBloc>().add(CompanyNameChanged(value));
              },
            ),
            _buildInputField(
              context,
              label: 'Address of the company',
              onChanged: (value) {
                formData['Address of the company'] = value;
                context.read<RegisterBloc>().add(AddressChanged(value));
              },
            ),
            _buildInputField(
              context,
              label: 'Phone Number',
              onChanged: (value) {
                formData['Phone Number'] = value;
                context.read<RegisterBloc>().add(PhoneNumberChanged(value));
              },
            ),
            _buildInputField(
              context,
              label: 'Tin Number',
              onChanged: (value) {
                formData['Tin Number'] = value;
                context.read<RegisterBloc>().add(TinNumberChanged(value));
              },
            ),
            _buildInputField(
              context,
              label: 'Number of employees',
              onChanged: (value) {
                formData['Number of employees'] = value;
                context.read<RegisterBloc>().add(NumberOfEmployeesChanged(value));
              },
            ),
            _buildInputField(
              context,
              label: 'Company bank',
              onChanged: (value) {
                formData['Company bank'] = value;
                context.read<RegisterBloc>().add(CompanyBankChanged(value));
              },
            ),
            _buildInputField(
              context,
              label: 'Bank account number',
              onChanged: (value) {
                formData['Bank account number'] = value;
                context.read<RegisterBloc>().add(BankAccountNumberChanged(value));
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _onSubmit(context, formData),
                child: const Text('Submit for approval'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      BuildContext context, {
        required String label,
        required Function(String) onChanged,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
