import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CompanyNameChanged extends RegisterEvent {
  final String companyName;

  CompanyNameChanged(this.companyName);

  @override
  List<Object> get props => [companyName];
}

class AddressChanged extends RegisterEvent {
  final String address;

  AddressChanged(this.address);

  @override
  List<Object> get props => [address];
}

class PhoneNumberChanged extends RegisterEvent {
  final String phoneNumber;

  PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class TinNumberChanged extends RegisterEvent {
  final String tinNumber;

  TinNumberChanged(this.tinNumber);

  @override
  List<Object> get props => [tinNumber];
}

class NumberOfEmployeesChanged extends RegisterEvent {
  final String numberOfEmployees;

  NumberOfEmployeesChanged(this.numberOfEmployees);

  @override
  List<Object> get props => [numberOfEmployees];
}

class CompanyBankChanged extends RegisterEvent {
  final String companyBank;

  CompanyBankChanged(this.companyBank);

  @override
  List<Object> get props => [companyBank];
}

class BankAccountNumberChanged extends RegisterEvent {
  final String bankAccountNumber;

  BankAccountNumberChanged(this.bankAccountNumber);

  @override
  List<Object> get props => [bankAccountNumber];
}

class SubmitRegisterForm extends RegisterEvent {}
