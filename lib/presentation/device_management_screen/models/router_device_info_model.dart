class RouterDeviceInfoModel {
  String? deviceIcon;
  String deviceName;
  String deviceUptime;
  String? actionButtonText;
  bool isMainRouter;

  RouterDeviceInfoModel({
    this.deviceIcon,
    this.deviceName = 'NA',
    this.deviceUptime = 'NA',
    this.actionButtonText,
    this.isMainRouter = false,
  }) {
    deviceIcon =
        deviceIcon ?? 'assets/images/img_depth_4_frame_0_white_a700_48x48.svg';
    deviceName = deviceName;
    deviceUptime = deviceUptime;
    actionButtonText = actionButtonText;
    isMainRouter = isMainRouter;
  }
}
