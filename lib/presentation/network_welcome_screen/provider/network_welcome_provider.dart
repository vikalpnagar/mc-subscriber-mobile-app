import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/network_welcome_model.dart';

class NetworkWelcomeProvider extends ChangeNotifier {
  NetworkWelcomeModel networkWelcomeModel = NetworkWelcomeModel();

  @override
  void dispose() {
    super.dispose();
  }

  void initialize() {
    // Initialize any required data
  }

  void onLogInPressed() {
    NavigatorService.pushNamed(AppRoutes.loginScreen);
  }

  void onSignUpPressed() {
    NavigatorService.pushNamed(AppRoutes.signUpScreen);
  }
}
