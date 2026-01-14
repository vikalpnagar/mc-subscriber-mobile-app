import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class PasswordResetConfirmationProvider extends ChangeNotifier {
  void navigateToLogin() {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
  }
}
