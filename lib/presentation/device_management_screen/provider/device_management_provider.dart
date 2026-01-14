import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:family_wifi/core/utils/streamer.dart';
import 'package:family_wifi/presentation/device_management_screen/models/router_device_info_model.dart';
import 'package:family_wifi/presentation/home_screen/models/topology_info.dart';
import 'package:flutter/material.dart';

import '../models/mobile_device_info_model.dart';

class DeviceManagementProvider {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Streamer<List<MobileDeviceInfoModel>> _mobileDevices = new Streamer();
  Stream<List<MobileDeviceInfoModel>?> get mobileDevices =>
      _mobileDevices.stream;
  List<MobileDeviceInfoModel>? get mobileDevicesInitialData =>
      _mobileDevices.value;

  Streamer<List<RouterDeviceInfoModel>> _routerDevices = new Streamer();
  Stream<List<RouterDeviceInfoModel>?> get routerDevices =>
      _routerDevices.stream;
  List<RouterDeviceInfoModel>? get routerDevicesInitialData =>
      _routerDevices.value;

  void initialize() {
    // Put any initializations here
  }

  void handleTopologyInfo(TopologyInfo? topologyInfo) {
    if (topologyInfo != null && (topologyInfo.nodes?.isNotEmpty ?? false)) {
      _mobileDevices.value = topologyInfo.nodes!
          .map((tpNode) {
            return tpNode.aps?.map((apNode) {
              return apNode.clients?.map((clientNode) {
                return MobileDeviceInfoModel(
                  id: '4',
                  deviceName: clientNode.station ?? 'NA',
                  uploadSpeed: '${clientNode.txRateBitrate.bpsToMbps} Mbps ↑',
                  downloadSpeed: '${clientNode.rxRateBitrate.bpsToMbps} Mbps ↓',
                );
              });
            });
          })
          .deepFlatten<MobileDeviceInfoModel>()
          .toList();

      _routerDevices.value = topologyInfo.nodes!.map((tpNode) {
        int noOfClients =
            tpNode.aps?.fold<int>(
              0,
              (previous, aps) => previous + (aps.clients?.length ?? 0),
            ) ??
            0;
        return RouterDeviceInfoModel(
          deviceName: tpNode.serial ?? 'NA',
          deviceUptime: tpNode.uptime.formatSeconds,
          actionButtonText:
              '$noOfClients ${noOfClients > 1
                  ? 'Devices'
                  : noOfClients == 1
                  ? 'Device'
                  : null}',
        );
      }).toList();
    } else {
      if (_mobileDevices.hasValue) {
        _mobileDevices.value = null;
      }
      if (_mobileDevices.hasValue) {
        _mobileDevices.value = null;
      }
    }
  }

  void toggleDevicePause(MobileDeviceInfoModel device) {
    // int index = _mobileDevicesStreamer.value.indexWhere(
    //   (d) => d.id == device.id,
    // );
    // if (index != -1) {
    //   _mobileDevicesStreamer.value[index] = _mobileDevicesStreamer.value[index]
    //       .copyWith(
    //         isPaused: !(_mobileDevicesStreamer.value[index].isPaused ?? false),
    //       );
    // }
  }

  void dispose() {
    _mobileDevices.close();
  }
}

extension IterableExtension on Iterable {
  // A generic function to deeply flatten any nested, nullable iterable structure
  Iterable<T> deepFlatten<T>() sync* {
    for (final element in this) {
      if (element == null) {
        continue; // Skip if an inner iterable or element is null
      }

      // Check if the element is itself an Iterable (but not a String)
      // String is a special case of Iterable<int> but should be treated as a single element
      if (element is Iterable && element is! String) {
        // Recursively flatten the nested iterable
        yield* element.deepFlatten<T>();
      } else {
        // If it's a CustomModel or other non-iterable, yield it
        // We cast it to T, assuming the input structure eventually resolves to T
        yield element as T;
      }
    }
  }
}

extension RateExtension on num? {
  double get bpsToMbps => (this ?? 0) > 0 ? this! / 1000000 : 0;
  double get bpsToKbps => (this ?? 0) > 0 ? this! / 1000 : 0;

  String get formatSeconds {
    if (this != null) {
      // Define constants for time units
      const int secondsPerMinute = 60;
      const int secondsPerHour = 3600; // 60 * 60
      const int secondsPerDay = 86400; // 24 * 3600
      const int secondsPerWeek = 604800; // 7 * 86400
      const int secondsPerMonth = 2592000; // 30 * 86400
      const int secondsPerYear = 31536000; // ~365 * 86400 (approximate)

      int years = this! ~/ secondsPerYear;
      int remainingSeconds = (this! % secondsPerYear).toInt();

      int months = remainingSeconds ~/ secondsPerMonth;
      remainingSeconds %= secondsPerMonth;

      int weeks = remainingSeconds ~/ secondsPerWeek;
      remainingSeconds %= secondsPerWeek;

      int days = remainingSeconds ~/ secondsPerDay;
      remainingSeconds %= secondsPerDay;

      int hours = remainingSeconds ~/ secondsPerHour;
      remainingSeconds %= secondsPerHour;

      int minutes = remainingSeconds ~/ secondsPerMinute;
      remainingSeconds %= secondsPerMinute;

      int seconds = remainingSeconds;

      List<String> parts = [];
      if (years > 0) parts.add('$years years');
      if (months > 0) parts.add('$years months');
      if (weeks > 0) parts.add('$weeks weeks');
      if (days > 0) parts.add('$days days');
      if (hours > 0) parts.add('$hours hours');
      if (minutes > 0) parts.add('$minutes minutes');
      if (seconds > 0 || parts.isEmpty) parts.add('$seconds seconds');

      return parts.join(', ');
    }
    return 'NA';
  }
}
