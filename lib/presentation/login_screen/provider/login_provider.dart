import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/login_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initialize() {
    isLoading = false;
    emailController.clear();
    passwordController.clear();
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty == true) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value ?? '')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value?.isEmpty == true) {
      return 'Password is required';
    }
    if ((value?.length ?? 0) < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> onLoginPressed() async {
    isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 2));

      loginModel = LoginModel(
        email: emailController.text,
        password: passwordController.text,
        isSuccess: true,
      );

      isLoading = false;
      notifyListeners();

      emailController.clear();
      passwordController.clear();

      NavigatorService.pushNamed(AppRoutes.networkDashboardScreen);
    } catch (e) {
      isLoading = false;
      loginModel = loginModel.copyWith(isSuccess: false);
      notifyListeners();
    }
  }
}
