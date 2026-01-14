import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/add_device_setup_model.dart';

class AddDeviceSetupProvider extends ChangeNotifier {
  AddDeviceSetupModel addDeviceSetupModel = AddDeviceSetupModel();
  TextEditingController macAddressController = TextEditingController();
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    macAddressController.dispose();
    super.dispose();
  }

  void initialize() {
    // Initialize any required data
  }

  String? validateMacAddress(String? value) {
    if (value?.isEmpty == true) {
      return 'MAC Address is required';
    }
    // Basic MAC address validation
    final macPattern = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
    if (!macPattern.hasMatch(value ?? '')) {
      return 'Please enter a valid MAC address';
    }
    return null;
  }

  Future<void> onNextPressed(BuildContext context) async {
    final macAddress = macAddressController.text.trim();

    // Validate MAC address
    if (validateMacAddress(macAddress) != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid MAC address'),
          backgroundColor: appTheme.redCustom,
        ),
      );
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      // Simulate processing
      await Future.delayed(Duration(seconds: 1));

      // Update model with the entered MAC address
      addDeviceSetupModel.macAddress = macAddress;

      isLoading = false;
      notifyListeners();

      // Navigate to device configuration screen
      NavigatorService.pushNamed(AppRoutes.deviceConfigurationScreen);
    } catch (e) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong. Please try again.'),
          backgroundColor: appTheme.redCustom,
        ),
      );
    }
  }
}
