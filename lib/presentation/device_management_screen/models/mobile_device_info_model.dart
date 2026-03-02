/// This class is used in the [device_management_screen] screen.

// ignore_for_file: must_be_immutable
class MobileDeviceInfoModel {
  final String macAddress;
  final String deviceName;
  final String uploadSpeed;
  final String downloadSpeed;
  final String? iconPath;
  final String actionLabel;
  final bool isPaused;
  final bool isPauseResumeInProgress;
  final bool isHistoricalDevice;

  MobileDeviceInfoModel({
    required this.macAddress,
    this.deviceName = 'NA',
    this.uploadSpeed = 'NA',
    this.downloadSpeed = 'NA',
    this.iconPath = 'assets/images/img_depth_4_frame_0_1.svg',
    required this.actionLabel,
    this.isPaused = false,
    this.isPauseResumeInProgress = false,
    this.isHistoricalDevice = false,
  });

  MobileDeviceInfoModel copyWith({
    String? macAddress,
    String? deviceName,
    String? uploadSpeed,
    String? downloadSpeed,
    String? iconPath,
    String? actionLabel,
    bool? isPaused,
    bool? isPauseResumeInProgress,
    bool? isHistoricalDevice,
  }) {
    return MobileDeviceInfoModel(
      macAddress: macAddress ?? this.macAddress,
      deviceName: deviceName ?? this.deviceName,
      uploadSpeed: uploadSpeed ?? this.uploadSpeed,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      iconPath: iconPath ?? this.iconPath,
      actionLabel: actionLabel ?? this.actionLabel,
      isPaused: isPaused ?? this.isPaused,
      isPauseResumeInProgress:
          isPauseResumeInProgress ?? this.isPauseResumeInProgress,
      isHistoricalDevice: isHistoricalDevice ?? this.isHistoricalDevice,
    );
  }
}
