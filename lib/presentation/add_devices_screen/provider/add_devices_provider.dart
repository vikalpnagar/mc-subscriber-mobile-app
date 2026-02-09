import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/add_devices_model.dart';

class AddDevicesProvider extends ChangeNotifier {
  List<AddDevicesModel> _availableDevices = [];

  List<AddDevicesModel> get availableDevices => _availableDevices;

  List<AddDevicesModel> get selectedDevices =>
      _availableDevices.where((device) => device.isSelected ?? false).toList();

  void initialize() {
    _availableDevices = [
      AddDevicesModel(
        id: '1',
        name: "Liam's Phone",
        model: 'iPhone 13 Pro',
        icon: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
      AddDevicesModel(
        id: '2',
        name: "Sophia's Phone",
        model: 'Samsung Galaxy S21',
        icon: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
      AddDevicesModel(
        id: '3',
        name: "Noah's Tablet",
        model: 'iPad Pro',
        icon: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
      AddDevicesModel(
        id: '4',
        name: "Ava's Phone",
        model: 'Google Pixel 6',
        icon: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
    ];
    notifyListeners();
  }

  void toggleDeviceSelection(AddDevicesModel device) {
    final index = _availableDevices.indexWhere((d) => d.id == device.id);
    if (index != -1) {
      _availableDevices[index] = _availableDevices[index].copyWith(
        isSelected: !(_availableDevices[index].isSelected ?? false),
      );
      notifyListeners();
    }
  }

  void addSelectedDevices() {
    final selected = selectedDevices;
    if (selected.isNotEmpty) {
      // Process selected devices
      print('Adding ${selected.length} devices');
      // Navigate back or to next screen
    }
  }
}
