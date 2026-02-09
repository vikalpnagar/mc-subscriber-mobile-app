import 'package:flutter/material.dart';
import '../models/edit_guest_network_model.dart';

class EditGuestNetworkProvider extends ChangeNotifier {
  EditGuestNetworkModel editGuestNetworkModel = EditGuestNetworkModel();
  TextEditingController networkNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    networkNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void initialize() {
    editGuestNetworkModel = EditGuestNetworkModel(
      isGuestNetworkEnabled: true,
      networkName: 'Guest_Network',
      password: 'password123',
    );

    networkNameController.text = editGuestNetworkModel.networkName ?? '';
    passwordController.text = editGuestNetworkModel.password ?? '';
    notifyListeners();
  }

  void toggleGuestNetwork(bool value) {
    editGuestNetworkModel = editGuestNetworkModel.copyWith(
      isGuestNetworkEnabled: value,
    );
    notifyListeners();
  }

  bool _validateNetworkName(String? value) {
    return value?.isNotEmpty == true && value!.length >= 2;
  }

  bool _validatePassword(String? value) {
    return value?.isNotEmpty == true && value!.length >= 8;
  }

  void saveChanges() {
    if (!_validateNetworkName(networkNameController.text)) {
      return;
    }

    if (!_validatePassword(passwordController.text)) {
      return;
    }

    isLoading = true;
    notifyListeners();

    editGuestNetworkModel = editGuestNetworkModel.copyWith(
      networkName: networkNameController.text,
      password: passwordController.text,
    );

    // Simulate API call
    Future.delayed(Duration(seconds: 1), () {
      isLoading = false;
      notifyListeners();

      // Clear form after successful save
      networkNameController.clear();
      passwordController.clear();
    });
  }
}
