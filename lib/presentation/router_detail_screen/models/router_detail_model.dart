/// This class is used in the [router_detail_screen] screen.

// ignore_for_file: must_be_immutable
class RouterDetailModel {
  RouterDetailModel({
    this.routerImage,
    this.routerName,
    this.routerModel,
    this.serialNumber,
    this.firmwareVersion,
    this.ipAddress,
    this.macAddress,
    this.status,
    this.id,
  }) {
    routerImage = routerImage ?? 'assets/images/img_depth_5_frame_0.png';
    routerName = routerName ?? 'Main Router';
    routerModel = routerModel ?? 'Model: AX6000';
    serialNumber = serialNumber ?? 'Serial: 1234567890';
    firmwareVersion = firmwareVersion ?? 'v1.2.3';
    ipAddress = ipAddress ?? '192.168.1.1';
    macAddress = macAddress ?? '00:1A:2B:3C:4D:5E';
    status = status ?? 'Online';
    id = id ?? '';
  }

  String? routerImage;
  String? routerName;
  String? routerModel;
  String? serialNumber;
  String? firmwareVersion;
  String? ipAddress;
  String? macAddress;
  String? status;
  String? id;
}
