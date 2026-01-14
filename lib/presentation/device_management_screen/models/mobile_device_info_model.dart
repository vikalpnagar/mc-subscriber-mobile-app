/// This class is used in the [device_management_screen] screen.

// ignore_for_file: must_be_immutable
class MobileDeviceInfoModel {
  MobileDeviceInfoModel({
    this.id,
    this.deviceName = 'NA',
    this.uploadSpeed = 'NA',
    this.downloadSpeed = 'NA',
    this.iconPath,
    this.isPaused = false,
  }) {
    id = id ?? '';
    deviceName = deviceName;
    uploadSpeed = uploadSpeed;
    downloadSpeed = downloadSpeed;
    iconPath = iconPath ?? 'assets/images/img_depth_4_frame_0_1.svg';
    isPaused = isPaused;
  }

  String? id;
  String deviceName;
  String uploadSpeed;
  String downloadSpeed;
  String? iconPath;
  bool isPaused;
}
