import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/add_family_wi_fi_group_model.dart';
import '../models/device_item_model.dart';

class AddFamilyWiFiGroupProvider extends ChangeNotifier {
  AddFamilyWiFiGroupModel addFamilyWiFiGroupModel = AddFamilyWiFiGroupModel();
  TextEditingController groupNameController = TextEditingController();
  List<DeviceItemModel> deviceList = [];

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  void initialize() {
    deviceList = [
      DeviceItemModel(
        deviceName: "Noah's Phone",
        deviceType: "iPhone 14 Pro",
        iconPath: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
      DeviceItemModel(
        deviceName: "Noah's Tablet",
        deviceType: "iPad Pro",
        iconPath: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
      DeviceItemModel(
        deviceName: "Olivia's Phone",
        deviceType: "iPhone 13",
        iconPath: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
      DeviceItemModel(
        deviceName: "Lucas's Phone",
        deviceType: "iPhone 12",
        iconPath: ImageConstant.imgDepth4Frame01,
        isSelected: false,
      ),
    ];
  }

  void toggleDeviceSelection(int index) {
    if (index >= 0 && index < deviceList.length) {
      deviceList[index] = deviceList[index].copyWith(
        isSelected: !(deviceList[index].isSelected ?? false),
      );
      notifyListeners();
    }
  }

  void addGroup(BuildContext context) {
    if (groupNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a group name')),
      );
      return;
    }

    List<DeviceItemModel> selectedDevices =
        deviceList.where((device) => device.isSelected ?? false).toList();

    if (selectedDevices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select at least one device')),
      );
      return;
    }

    // Process group creation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text('Group "${groupNameController.text}" created successfully')),
    );

    // Clear form
    groupNameController.clear();
    for (int i = 0; i < deviceList.length; i++) {
      deviceList[i] = deviceList[i].copyWith(isSelected: false);
    }
    notifyListeners();

    // Navigate back
    NavigatorService.goBack();
  }
}
