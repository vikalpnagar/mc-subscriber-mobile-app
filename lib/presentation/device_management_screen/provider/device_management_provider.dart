import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/device_management_model.dart';

class DeviceManagementProvider extends ChangeNotifier {
  List<DeviceManagementModel> _mobileDevices = [];
  int _selectedTabIndex = 0;

  List<DeviceManagementModel> get mobileDevices => _mobileDevices;
  int get selectedTabIndex => _selectedTabIndex;

  void initialize() {
    _mobileDevices = [
      DeviceManagementModel(
        id: '1',
        deviceName: 'Liam\'s iPhone',
        uploadSpeed: '12 Mbps ↑',
        downloadSpeed: '25 Mbps ↓',
        iconPath: ImageConstant.imgDepth4Frame01,
        isPaused: false,
      ),
      DeviceManagementModel(
        id: '2',
        deviceName: 'Sophia\'s iPhone',
        uploadSpeed: '10 Mbps ↑',
        downloadSpeed: '20 Mbps ↓',
        iconPath: ImageConstant.imgDepth4Frame01,
        isPaused: false,
      ),
      DeviceManagementModel(
        id: '3',
        deviceName: 'Ethan\'s iPhone',
        uploadSpeed: '8 Mbps ↑',
        downloadSpeed: '15 Mbps ↓',
        iconPath: ImageConstant.imgDepth4Frame01,
        isPaused: false,
      ),
      DeviceManagementModel(
        id: '4',
        deviceName: 'Olivia\'s iPhone',
        uploadSpeed: '15 Mbps ↑',
        downloadSpeed: '30 Mbps ↓',
        iconPath: ImageConstant.imgDepth4Frame01,
        isPaused: false,
      ),
    ];
  }

  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void toggleDevicePause(DeviceManagementModel device) {
    int index = _mobileDevices.indexWhere((d) => d.id == device.id);
    if (index != -1) {
      _mobileDevices[index] = _mobileDevices[index].copyWith(
        isPaused: !(_mobileDevices[index].isPaused ?? false),
      );
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
