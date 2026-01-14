import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../models/network_dashboard_model.dart';
import '../models/network_item_model.dart';

class NetworkDashboardProvider extends ChangeNotifier {
  NetworkDashboardModel networkDashboardModel = NetworkDashboardModel();
  int selectedBottomBarIndex = 0;
  List<NetworkItemModel> networkItems = [];
  List<CustomBottomBarItem> bottomBarItems = [];

  void initialize() {
    _initializeNetworkItems();
    _initializeBottomBarItems();
  }

  void _initializeNetworkItems() {
    networkItems = [
      NetworkItemModel(
        title: '12 Devices',
        subtitle: 'Mobile Devices',
        value: '2.5 GB',
        onTap: () {},
      ),
      NetworkItemModel(
        title: 'Family WiFi',
        subtitle: 'Manage parental controls',
        value: '3 Groups',
        onTap: () {},
      ),
      NetworkItemModel(
        title: 'Speed Test',
        subtitle: 'Last test: 2024-01-20 10:00 AM',
        value: '100 Mbps',
        onTap: () {},
      ),
    ];
  }

  void _initializeBottomBarItems() {
    bottomBarItems = [
      CustomBottomBarItem(
        icon: ImageConstant.imgNavDashboard,
        activeIcon: ImageConstant.imgNavDashboard,
        title: 'Dashboard',
        routeName: '/dashboard',
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavDevices,
        activeIcon: ImageConstant.imgNavDevicesWhiteA700,
        title: 'Devices',
        routeName: '/devices',
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavSettings,
        activeIcon: ImageConstant.imgNavSettingsWhiteA700,
        title: 'Settings',
        routeName: '/settings',
      ),
    ];
  }

  void updateSelectedIndex(int index) {
    selectedBottomBarIndex = index;
    notifyListeners();
  }
}
