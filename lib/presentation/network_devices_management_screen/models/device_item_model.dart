class DeviceItemModel {
  String? deviceIcon;
  String? deviceName;
  String? deviceUptime;
  String? actionButtonText;
  bool? isMainRouter;

  DeviceItemModel({
    this.deviceIcon,
    this.deviceName,
    this.deviceUptime,
    this.actionButtonText,
    this.isMainRouter,
  }) {
    deviceIcon =
        deviceIcon ?? 'assets/images/img_depth_4_frame_0_white_a700_48x48.svg';
    deviceName = deviceName ?? '';
    deviceUptime = deviceUptime ?? '';
    actionButtonText = actionButtonText ?? 'Pause';
    isMainRouter = isMainRouter ?? false;
  }
}
