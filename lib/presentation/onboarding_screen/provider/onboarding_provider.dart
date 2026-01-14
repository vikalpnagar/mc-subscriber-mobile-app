import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/onboarding_model.dart';

class OnboardingProvider extends ChangeNotifier {
  OnboardingModel onboardingModel = OnboardingModel();

  void initialize() {
    onboardingModel = OnboardingModel(
      currentPage: 0,
      totalPages: 3,
    );

    Future.delayed(Duration(seconds: 3), () {
      navigateToNextScreen();
    });
  }

  void navigateToNextScreen() {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.networkWelcomeScreen);
  }

  void updateCurrentPage(int page) {
    onboardingModel = onboardingModel.copyWith(currentPage: page);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
