import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/action_item_model.dart';
import '../models/connected_device_model.dart';
import '../models/router_detail_model.dart';
import '../models/uptime_item_model.dart';

class RouterDetailProvider extends ChangeNotifier {
  RouterDetailModel routerDetailModel = RouterDetailModel();
  List<UptimeItemModel> uptimeItems = [];
  List<ConnectedDeviceModel> connectedDevices = [];
  List<ActionItemModel> actionItems = [];

  @override
  void dispose() {
    super.dispose();
  }

  void initialize() {
    _initializeRouterDetails();
    _initializeUptimeItems();
    _initializeConnectedDevices();
    _initializeActionItems();
    notifyListeners();
  }

  void _initializeRouterDetails() {
    routerDetailModel = RouterDetailModel(
      routerImage: ImageConstant.imgDepth5Frame0,
      routerName: 'Main Router',
      routerModel: 'Model: AX6000',
      serialNumber: 'Serial: 1234567890',
      firmwareVersion: 'v1.2.3',
      ipAddress: '192.168.1.1',
      macAddress: '00:1A:2B:3C:4D:5E',
      status: 'Online',
    );
  }

  void _initializeUptimeItems() {
    uptimeItems = [
      UptimeItemModel(
        value: '2',
        label: 'Days',
      ),
      UptimeItemModel(
        value: '14',
        label: 'Hours',
      ),
      UptimeItemModel(
        value: '32',
        label: 'Minutes',
      ),
      UptimeItemModel(
        value: '15',
        label: 'Seconds',
      ),
    ];
  }

  void _initializeConnectedDevices() {
    connectedDevices = [
      ConnectedDeviceModel(
        icon: ImageConstant.imgDepth3Frame0WhiteA700,
        deviceName: "Ethan's MacBook",
        deviceType: 'Laptop',
      ),
      ConnectedDeviceModel(
        icon: ImageConstant.imgDepth4Frame01,
        deviceName: "Sophia's iPhone",
        deviceType: 'Smartphone',
      ),
      ConnectedDeviceModel(
        icon: ImageConstant.imgDepth4Frame02,
        deviceName: 'Living Room TV',
        deviceType: 'Smart TV',
      ),
    ];
  }

  void _initializeActionItems() {
    actionItems = [
      ActionItemModel(
        icon: ImageConstant.imgDepth3Frame0WhiteA70040x40,
        title: 'Reboot Device',
        actionType: 'reboot',
      ),
      ActionItemModel(
        icon: ImageConstant.imgDepth3Frame040x40,
        title: 'Firmware Update',
        actionType: 'update',
      ),
      ActionItemModel(
        icon: ImageConstant.imgDepth3Frame01,
        title: 'Remove Device',
        actionType: 'remove',
      ),
    ];
  }

  void handleActionTap(ActionItemModel action) {
    switch (action.actionType) {
      case 'reboot':
        _handleRebootDevice();
        break;
      case 'update':
        _handleFirmwareUpdate();
        break;
      case 'remove':
        _handleRemoveDevice();
        break;
      default:
        break;
    }
  }

  void _handleRebootDevice() {
    // Handle reboot device action
    print('Rebooting device...');
  }

  void _handleFirmwareUpdate() {
    // Handle firmware update action
    print('Starting firmware update...');
  }

  void _handleRemoveDevice() {
    // Handle remove device action
    print('Removing device...');
  }
}
