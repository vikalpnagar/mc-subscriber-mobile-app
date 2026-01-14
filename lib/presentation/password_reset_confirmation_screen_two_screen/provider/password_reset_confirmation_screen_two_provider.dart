import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class PasswordResetConfirmationScreenTwoProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void initialize() {
    _isLoading = false;
    notifyListeners();
  }

  void onOpenEmailApp() {
    _isLoading = true;
    notifyListeners();

    // Simulate opening email app
    // In a real implementation, you would use url_launcher or platform-specific methods
    // to open the default email application

    Future.delayed(Duration(milliseconds: 500), () {
      _isLoading = false;
      notifyListeners();

      // After opening email app, potentially navigate back to login
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
