import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<CompanyNameChanged>((event, emit) {
      emit(state.copyWith(companyName: event.companyName));
    });
    on<AddressChanged>((event, emit) {
      emit(state.copyWith(address: event.address));
    });
    on<PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });
    on<TinNumberChanged>((event, emit) {
      emit(state.copyWith(tinNumber: event.tinNumber));
    });
    on<NumberOfEmployeesChanged>((event, emit) {
      emit(state.copyWith(numberOfEmployees: event.numberOfEmployees));
    });
    on<CompanyBankChanged>((event, emit) {
      emit(state.copyWith(companyBank: event.companyBank));
    });
    on<BankAccountNumberChanged>((event, emit) {
      emit(state.copyWith(bankAccountNumber: event.bankAccountNumber));
    });

    on<SubmitRegisterForm>((event, emit) async {
      try {
        // Access the already-opened box
        final box = Hive.box('companyData');

        // Save form data
        await box.putAll({
          'companyName': state.companyName,
          'address': state.address,
          'phoneNumber': state.phoneNumber,
          'tinNumber': state.tinNumber,
          'numberOfEmployees': state.numberOfEmployees,
          'companyBank': state.companyBank,
          'bankAccountNumber': state.bankAccountNumber,
        });

        print("Data saved successfully!");
      } catch (error) {
        print("Error saving data: $error");
      }
    });
  }
}
