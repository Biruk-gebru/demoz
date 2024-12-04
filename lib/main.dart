import 'package:flutter/material.dart';
import 'features/auth/presentation/screens/signup_screen.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demoz Payroll',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), // Splash Screen Route
        '/signup': (context) => SignupScreen(), // Sign Up Screen Route
      },
    );
  }
}
