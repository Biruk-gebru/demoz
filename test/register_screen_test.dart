import 'package:demoz/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('RegisterScreen Tests', () {
    testWidgets('Submit button does nothing when fields are empty', (WidgetTester tester) async {
      // Build the RegisterScreen widget
      await tester.pumpWidget(
        MaterialApp(
          home: RegisterScreen(),
        ),
      );

      // Verify that the submit button is present and can be tapped
      final submitButton = find.text('Submit for approval');
      expect(submitButton, findsOneWidget);

      // Tap the submit button
      await tester.tap(submitButton);
      await tester.pump();

      // No error message should be displayed since the validation happens in `_onSubmit`
      expect(find.text('Please fill out all fields with valid data.'), findsNothing);
    });

    testWidgets('Shows error when invalid phone number is entered', (WidgetTester tester) async {
      // Build the RegisterScreen widget
      await tester.pumpWidget(
        MaterialApp(
          home: RegisterScreen(),
        ),
      );

      // Enter a valid company name
      await tester.enterText(find.byType(TextField).at(0), 'Demo Company');
      await tester.enterText(find.byType(TextField).at(1), '123 Street');
      await tester.enterText(find.byType(TextField).at(2), '12345'); // Invalid phone number
      await tester.pump();

      // Tap the submit button
      await tester.tap(find.text('Submit for approval'));
      await tester.pump();

      // Verify that the error message is shown
      expect(find.text('Please fill out all fields with valid data.'), findsOneWidget);
    });

    testWidgets('Does not navigate when invalid data is submitted', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: RegisterScreen(),
        ),
      );

      // Enter invalid data for TIN
      await tester.enterText(find.byType(TextField).at(3), 'TIN123'); // Invalid TIN
      await tester.pump();

      // Tap the submit button
      await tester.tap(find.text('Submit for approval'));
      await tester.pump();

      // Ensure it does not navigate (stays on the same screen)
      expect(find.text('DemoZ Payroll'), findsOneWidget);
    });

    testWidgets('Navigates to /home on valid data submission', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => RegisterScreen(),
            '/home': (context) => const Scaffold(body: Text('Home Screen')),
          },
        ),
      );

      // Enter valid data for all fields
      await tester.enterText(find.byType(TextField).at(0), 'Demo Company'); // Company name
      await tester.enterText(find.byType(TextField).at(1), '123 Street'); // Address
      await tester.enterText(find.byType(TextField).at(2), '1234567890'); // Valid phone number
      await tester.enterText(find.byType(TextField).at(3), '123456'); // Valid TIN
      await tester.enterText(find.byType(TextField).at(4), '10'); // Valid number of employees
      await tester.enterText(find.byType(TextField).at(5), 'Demo Bank'); // Company bank
      await tester.enterText(find.byType(TextField).at(6), '1234567890'); // Bank account number
      await tester.pump();

      // Tap the submit button
      await tester.tap(find.text('Submit for approval'));
      await tester.pumpAndSettle();

      // Verify that it navigates to the home screen
      expect(find.text('Home Screen'), findsOneWidget);
    });
  });
}
