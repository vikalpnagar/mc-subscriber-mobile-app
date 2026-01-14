import './device_item_model.dart';

class NetworkDevicesManagementModel {
  List<DeviceItemModel>? deviceList;

  NetworkDevicesManagementModel({
    this.deviceList,
  }) {
    deviceList = deviceList ?? [];
  }
}
