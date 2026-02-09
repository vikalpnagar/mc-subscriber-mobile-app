import 'package:flutter/material.dart';

import '../models/forgot_password_model.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void initialize() {
    isLoading = false;
    emailController.clear();
    notifyListeners();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  Future<void> onSendResetLink() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      // Clear form after successful submission
      emailController.clear();

      // Show success message
      // In a real app, you would navigate to confirmation screen
      // NavigatorService.pushNamed(AppRoutes.passwordResetConfirmationScreen);
    } catch (e) {
      // Handle error
      print('Error sending reset link: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
