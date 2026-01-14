import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/device_configuration_model.dart';

class DeviceConfigurationProvider extends ChangeNotifier {
  DeviceConfigurationModel deviceConfigurationModel =
      DeviceConfigurationModel();
  double _progressValue = 0.0;
  Timer? _progressTimer;

  double get progressValue => _progressValue;

  @override
  void dispose() {
    _progressTimer?.cancel();
    super.dispose();
  }

  void initialize() {
    _startProgressAnimation();
  }

  void _startProgressAnimation() {
    _progressTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_progressValue < 1.0) {
        _progressValue += 0.02;
        notifyListeners();
      } else {
        _progressTimer?.cancel();
        _navigateToNextScreen();
      }
    });
  }

  void _navigateToNextScreen() {
    Timer(Duration(milliseconds: 500), () {
      NavigatorService.pushNamedAndRemoveUntil(
          AppRoutes.deviceConfigurationSuccessScreen);
    });
  }
}
