import 'package:flutter/material.dart';

import '../../../core/app_export.dart';

class DeviceConfigurationSuccessProvider extends ChangeNotifier {
  void onDonePressed(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(AppRoutes.networkDashboardScreen);
  }
}
