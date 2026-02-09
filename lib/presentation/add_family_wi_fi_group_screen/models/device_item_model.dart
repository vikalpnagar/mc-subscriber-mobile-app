class DeviceItemModel {
  String? deviceName;
  String? deviceType;
  String? iconPath;
  bool? isSelected;
  String? id;

  DeviceItemModel({
    this.deviceName,
    this.deviceType,
    this.iconPath,
    this.isSelected,
    this.id,
  }) {
    deviceName = deviceName ?? '';
    deviceType = deviceType ?? '';
    iconPath = iconPath ?? 'assets/images/img_depth_4_frame_0_1.svg';
    isSelected = isSelected ?? false;
    id = id ?? '';
  }

  DeviceItemModel copyWith({
    String? deviceName,
    String? deviceType,
    String? iconPath,
    bool? isSelected,
    String? id,
  }) {
    return DeviceItemModel(
      deviceName: deviceName ?? this.deviceName,
      deviceType: deviceType ?? this.deviceType,
      iconPath: iconPath ?? this.iconPath,
      isSelected: isSelected ?? this.isSelected,
      id: id ?? this.id,
    );
  }
}
