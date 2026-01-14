import 'package:flutter/material.dart';

import '../models/sign_up_model.dart';

class SignUpProvider extends ChangeNotifier {
  SignUpModel signUpModel = SignUpModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController operatorIdController = TextEditingController();
  TextEditingController macAddressController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    operatorIdController.dispose();
    macAddressController.dispose();
    super.dispose();
  }

  void initialize() {
    signUpModel.email = '';
    signUpModel.operatorId = '';
    signUpModel.macAddress = '';
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? validateOperatorId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Operator ID is required';
    }

    return null;
  }

  String? validateMacAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'MAC address is required';
    }

    final macRegex = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
    if (!macRegex.hasMatch(value.trim())) {
      return 'Please enter a valid MAC address';
    }

    return null;
  }

  Future<void> onNextPressed(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      signUpModel.email = emailController.text.trim();
      signUpModel.operatorId = operatorIdController.text.trim();
      signUpModel.macAddress = macAddressController.text.trim();

      await Future.delayed(Duration(seconds: 2));

      emailController.clear();
      operatorIdController.clear();
      macAddressController.clear();

      // Navigate to next screen (assuming password reset confirmation)
      // NavigatorService.pushNamed(AppRoutes.passwordResetConfirmationScreen);

      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();

      // Handle error
      print('Sign up error: $error');
    }
  }
}
