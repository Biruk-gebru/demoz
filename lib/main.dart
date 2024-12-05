import 'package:demoz/features/auth/presentation/screens/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/auth/home/presentation/screens/home_screen.dart';
import 'features/auth/presentation/bloc/register_bloc.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/splash/presentation/screens/splash_screen.dart'; // Import the splash screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('your_box_name'); // Replace 'your_box_name' with the actual box name
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
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/signup': (context) => const SignupScreen(),
        '/register': (context) => BlocProvider(
          create: (context) => RegisterBloc(),
          child: const RegisterScreen(),
        ),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
