
# DemoZ Payroll Application

A lightweight and intuitive payroll management system to simplify company and employee payment processes.

---

## 🚀 Project Overview

DemoZ Payroll Application streamlines payroll management, tax compliance, and employee registration with an easy-to-use interface. Built with Flutter, it incorporates local data storage using Hive and state management with Flutter BLoC.

---

## ✨ Features

### 1. User Onboarding
- **Signup Screen**: Allows new users to create accounts with form validation.
- **Register Screen**: Captures company details and validates user inputs.

### 2. Navigation
- Seamless navigation between `Login`, `Signup`, and `Home` screens.
- Interactive splash screen with expandable bottom sheet.

### 3. Splash Screen
- Displays a custom logo inspired by modern CSS concepts.
- Includes animations and an expandable bottom sheet for quick access to Login and Signup.

### 4. Form Validation
- **Phone Number**: Validates 10-digit numeric format.
- **TIN Number**: Ensures the input is numeric.
- **Other Fields**: Verifies that fields are not empty and follow valid formats.

### 5. Local Storage
- Secure and lightweight data storage using Hive.

---

## 🏗️ Project Architecture

- **UI/UX**: Flutter for responsive design and Material Design principles.
- **State Management**: Flutter BLoC for predictable state transitions.
- **Storage**: Hive for efficient local data storage.
- **Routing**: Flutter Navigator API for dynamic screen navigation.

---

## 📦 Modules

### Splash Screen
- Interactive splash screen with a custom-designed logo.
- Bottom sheet navigation to Login and Signup screens.

### User Authentication
- **SignupScreen**: Handles user account creation with form validation.
- **LoginScreen**: Placeholder for login functionality.

### Company Registration
- **RegisterScreen**: Validates company details and stores them securely.
- **RegisterBloc**: Manages state for dynamic updates and submission logic.

---

## 🛠️ How to Run the Project

### Prerequisites
- Install [Flutter SDK](https://flutter.dev/docs/get-started/install).
- Verify installation:
  ```bash
  flutter doctor
  ```

### Steps to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repository/demoz.git
   cd demoz
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

4. Run the tests:
   ```bash
   flutter test
   ```

---

## ✅ Validation Rules

- **Phone Number**: Must be 10 digits (e.g., `1234567890`).
- **TIN Number**: Only numeric characters allowed.
- **Number of Employees**: Must be a positive integer.

---

## 🧪 Testing

### Unit Tests
Tests validate functionality, navigation, and input validation.

**Included Tests**:
1. Splash Screen interactivity.
2. Signup screen form validation.
3. Registration screen data submission.

---

## 📈 Future Enhancements

1. **Cloud Syncing**: Integrate Firebase for remote data storage.
2. **Employee Management**: Add features for employee onboarding and payroll generation.
3. **Analytics Dashboard**: Visualize payroll data with charts and graphs.

---

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **State Management**: Flutter BLoC
- **Local Storage**: Hive
- **Testing**: `flutter_test`

---

## 🏆 Acknowledgments

- Thanks to the Flutter community for excellent resources.
- Inspired by modern CSS and Material Design principles.
