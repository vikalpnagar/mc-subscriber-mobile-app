import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/device_item_model.dart';
import '../models/network_devices_management_model.dart';

class NetworkDevicesManagementProvider extends ChangeNotifier {
  NetworkDevicesManagementModel networkDevicesManagementModel =
      NetworkDevicesManagementModel();

  List<DeviceItemModel> get deviceList =>
      networkDevicesManagementModel.deviceList ?? [];

  void initialize() {
    networkDevicesManagementModel = NetworkDevicesManagementModel(
      deviceList: [
        DeviceItemModel(
          deviceIcon: ImageConstant.imgDepth4Frame0WhiteA70048x48,
          deviceName: 'Main Router',
          deviceUptime: 'Uptime: 2 days, 14 hours',
          actionButtonText: '3 Devices',
          isMainRouter: true,
        ),
        DeviceItemModel(
          deviceIcon: ImageConstant.imgDepth4Frame0WhiteA70048x48,
          deviceName: 'Mesh Point 1',
          deviceUptime: 'Uptime: 1 day, 20 hours',
          actionButtonText: 'Pause',
          isMainRouter: false,
        ),
        DeviceItemModel(
          deviceIcon: ImageConstant.imgDepth4Frame0WhiteA70048x48,
          deviceName: 'Mesh Point 2',
          deviceUptime: 'Uptime: 3 days, 5 hours',
          actionButtonText: 'Pause',
          isMainRouter: false,
        ),
        DeviceItemModel(
          deviceIcon: ImageConstant.imgDepth4Frame0WhiteA70048x48,
          deviceName: 'Mesh Point 3',
          deviceUptime: 'Uptime: 1 day, 12 hours',
          actionButtonText: 'Pause',
          isMainRouter: false,
        ),
      ],
    );
    notifyListeners();
  }

  void handleDeviceAction(DeviceItemModel device) {
    if (device.isMainRouter ?? false) {
      // Handle main router action - show connected devices
      print('Showing ${device.actionButtonText} connected devices');
    } else {
      // Handle mesh point pause/resume action
      print('${device.actionButtonText} action for ${device.deviceName}');
    }
  }
}
