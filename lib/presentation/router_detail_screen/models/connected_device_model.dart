/// This class is used in the [connected_device_item_widget] widget.

// ignore_for_file: must_be_immutable
class ConnectedDeviceModel {
  ConnectedDeviceModel({
    this.icon,
    this.deviceName,
    this.deviceType,
    this.id,
  }) {
    icon = icon ?? 'assets/images/img_depth_3_frame_0_white_a700.svg';
    deviceName = deviceName ?? 'Device Name';
    deviceType = deviceType ?? 'Device Type';
    id = id ?? '';
  }

  String? icon;
  String? deviceName;
  String? deviceType;
  String? id;
}
