/// This class is used in the [device_management_screen] screen.

// ignore_for_file: must_be_immutable
class DeviceManagementModel {
  DeviceManagementModel({
    this.id,
    this.deviceName,
    this.uploadSpeed,
    this.downloadSpeed,
    this.iconPath,
    this.isPaused,
  }) {
    id = id ?? '';
    deviceName = deviceName ?? '';
    uploadSpeed = uploadSpeed ?? '';
    downloadSpeed = downloadSpeed ?? '';
    iconPath = iconPath ?? 'assets/images/img_depth_4_frame_0_1.svg';
    isPaused = isPaused ?? false;
  }

  String? id;
  String? deviceName;
  String? uploadSpeed;
  String? downloadSpeed;
  String? iconPath;
  bool? isPaused;

  DeviceManagementModel copyWith({
    String? id,
    String? deviceName,
    String? uploadSpeed,
    String? downloadSpeed,
    String? iconPath,
    bool? isPaused,
  }) {
    return DeviceManagementModel(
      id: id ?? this.id,
      deviceName: deviceName ?? this.deviceName,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      iconPath: iconPath ?? this.iconPath,
      isPaused: isPaused ?? this.isPaused,
    );
  }
}
