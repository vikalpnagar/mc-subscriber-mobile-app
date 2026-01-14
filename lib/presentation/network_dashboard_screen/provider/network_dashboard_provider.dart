import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/network_dashboard_model.dart';
import '../models/network_item_model.dart';

class NetworkDashboardProvider extends ChangeNotifier {
  NetworkDashboardModel networkDashboardModel = NetworkDashboardModel();
  int selectedBottomBarIndex = 0;
  List<NetworkItemModel> networkItems = [];

  void initialize() {
    _initializeNetworkItems();
  }

  void _initializeNetworkItems() {
    networkItems = [
      NetworkItemModel(
        title: '12 Devices',
        subtitle: 'Mobile Devices',
        value: '2.5 GB',
        onTap: () {
          // NavigatorService.pushNamed(AppRoutes.networkDevicesManagementScreen);
        },
      ),
      NetworkItemModel(
        title: 'Family WiFi',
        subtitle: 'Manage parental controls',
        value: '3 Groups',
        onTap: () {
          NavigatorService.pushNamed(AppRoutes.familyWiFiManagementScreen);
        },
      ),
      NetworkItemModel(
        title: 'Speed Test',
        subtitle: 'Last test: 2024-01-20 10:00 AM',
        value: '100 Mbps',
        onTap: () {
          NavigatorService.pushNamed(AppRoutes.speedTestProgressScreen);
        },
      ),
    ];
  }

  void updateSelectedIndex(int index) {
    selectedBottomBarIndex = index;
    notifyListeners();
  }
}
