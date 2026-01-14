/// This class is used in the [AddDeviceSetupScreen] screen.

// ignore_for_file: must_be_immutable
class AddDeviceSetupModel {
  AddDeviceSetupModel({
    this.macAddress,
    this.isDeviceConnected,
    this.deviceId,
  }) {
    macAddress = macAddress ?? '';
    isDeviceConnected = isDeviceConnected ?? false;
    deviceId = deviceId ?? '';
  }

  String? macAddress;
  bool? isDeviceConnected;
  String? deviceId;
}
