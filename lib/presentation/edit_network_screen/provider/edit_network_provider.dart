import 'package:flutter/material.dart';

import '../models/edit_network_model.dart';

import '../../../core/app_export.dart';

class EditNetworkProvider extends ChangeNotifier {
  EditNetworkModel editNetworkModel = EditNetworkModel();

  TextEditingController networkNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    networkNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initialize() {
    // Initialize with existing network data if available
    networkNameController.text = editNetworkModel.networkName ?? '';
    passwordController.text = editNetworkModel.password ?? '';
  }

  String? validateNetworkName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Network name is required';
    }
    if (value.length < 2) {
      return 'Network name must be at least 2 characters';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  Future<void> saveChanges(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      // Update model with new values
      editNetworkModel = editNetworkModel.copyWith(
        networkName: networkNameController.text,
        password: passwordController.text,
      );

      // Simulate API call
      await Future.delayed(Duration(seconds: 1));

      // Clear form fields
      networkNameController.clear();
      passwordController.clear();

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Network settings saved successfully'),
          backgroundColor: appTheme.colorFF4CAF,
        ),
      );

      // Navigate back
      Navigator.pop(context);
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save network settings'),
          backgroundColor: appTheme.colorFFF443,
        ),
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
