/// This class is used in the [DeviceConfigurationScreen] screen.

// ignore_for_file: must_be_immutable
class DeviceConfigurationModel {
  DeviceConfigurationModel({
    this.title,
    this.progressValue,
  }) {
    title = title ?? 'Configuring the device...';
    progressValue = progressValue ?? 0.0;
  }

  String? title;
  double? progressValue;
}
