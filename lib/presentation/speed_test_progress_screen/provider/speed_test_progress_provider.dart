import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/speed_test_progress_model.dart';

class SpeedTestProgressProvider extends ChangeNotifier {
  SpeedTestProgressModel speedTestModel = SpeedTestProgressModel();
  bool isLoading = false;

  void initialize() {
    speedTestModel = SpeedTestProgressModel(
      progressPercentage: 60,
      downloadSpeed: '250 Mbps',
      uploadSpeed: '150 Mbps',
      isTestCompleted: false,
    );
    notifyListeners();
  }

  void rerunSpeedTest() {
    speedTestModel = speedTestModel.copyWith(
      progressPercentage: 0,
      downloadSpeed: '0 Mbps',
      uploadSpeed: '0 Mbps',
      isTestCompleted: false,
    );
    notifyListeners();

    // Start new speed test simulation
    _simulateSpeedTest();
  }

  void _simulateSpeedTest() {
    isLoading = true;
    notifyListeners();

    // Simulate progress updates
    Future.delayed(Duration(seconds: 1), () {
      speedTestModel = speedTestModel.copyWith(progressPercentage: 20);
      notifyListeners();
    });

    Future.delayed(Duration(seconds: 2), () {
      speedTestModel = speedTestModel.copyWith(progressPercentage: 40);
      notifyListeners();
    });

    Future.delayed(Duration(seconds: 3), () {
      speedTestModel = speedTestModel.copyWith(
        progressPercentage: 60,
        downloadSpeed: '250 Mbps',
        uploadSpeed: '150 Mbps',
      );
      isLoading = false;
      notifyListeners();
    });
  }

  void navigateToHistory(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.speedTestHistoryScreen);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
