import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String companyName;
  final String address;
  final String phoneNumber;
  final String tinNumber;
  final String numberOfEmployees;
  final String companyBank;
  final String bankAccountNumber;

  const RegisterState({
    this.companyName = '',
    this.address = '',
    this.phoneNumber = '',
    this.tinNumber = '',
    this.numberOfEmployees = '',
    this.companyBank = '',
    this.bankAccountNumber = '',
  });

  RegisterState copyWith({
    String? companyName,
    String? address,
    String? phoneNumber,
    String? tinNumber,
    String? numberOfEmployees,
    String? companyBank,
    String? bankAccountNumber,
  }) {
    return RegisterState(
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      tinNumber: tinNumber ?? this.tinNumber,
      numberOfEmployees: numberOfEmployees ?? this.numberOfEmployees,
      companyBank: companyBank ?? this.companyBank,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
    );
  }

  @override
  List<Object?> get props => [
    companyName,
    address,
    phoneNumber,
    tinNumber,
    numberOfEmployees,
    companyBank,
    bankAccountNumber,
  ];
}
