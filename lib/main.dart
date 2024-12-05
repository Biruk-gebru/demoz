import 'package:demoz/features/auth/presentation/screens/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/auth/home/presentation/screens/home_screen.dart';
import 'features/auth/presentation/bloc/register_bloc.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/managment/presentation/screens/company_profile.dart';
import 'features/managment/presentation/screens/managment_screen.dart'; // Import the management screen
import 'features/splash/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('registration_data'); // Updated box name for consistency
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demoz Payroll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/signup': (context) => const SignupScreen(),
        '/register': (context) => BlocProvider(
          create: (context) => RegisterBloc(),
          child: const RegisterScreen(),
        ),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const CompanyProfileScreen(),
        '/management': (context) => const ManagementScreen(), // Add the management screen route
      },
    );
  }
}
