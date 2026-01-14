import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../models/health_status_item_model.dart';
import '../models/network_health_model.dart';

class NetworkHealthProvider extends ChangeNotifier {
  NetworkHealthModel networkHealthModel = NetworkHealthModel();
  List<HealthStatusItemModel> healthStatusList = [];
  List<CustomBottomBarItem> bottomBarItemList = [];
  int selectedIndex = 0;
  bool isOverviewTabSelected = false;
  bool isHealthTabSelected = true;

  @override
  void dispose() {
    super.dispose();
  }

  void initialize() {
    _initializeHealthStatusList();
    _initializeBottomBarItems();
  }

  void _initializeHealthStatusList() {
    healthStatusList = [
      HealthStatusItemModel(
        icon: ImageConstant.imgDepth3Frame0WhiteA70048x48,
        title: 'Network Status',
        status: 'Good',
      ),
      HealthStatusItemModel(
        icon: ImageConstant.imgSearch,
        title: 'Internet Connection',
        status: 'Good',
      ),
      HealthStatusItemModel(
        icon: ImageConstant.imgDepth3Frame0WhiteA70048x48,
        title: 'WiFi Connection',
        status: 'Good',
      ),
      HealthStatusItemModel(
        icon: ImageConstant.imgDepth3Frame048x48,
        title: 'WiFi Speed',
        status: 'Good',
      ),
    ];
    notifyListeners();
  }

  void _initializeBottomBarItems() {
    bottomBarItemList = [
      CustomBottomBarItem(
        icon: ImageConstant.imgNavDashboardIndigo200,
        activeIcon: ImageConstant.imgNavDashboard,
        title: 'Dashboard',
        routeName: AppRoutes.networkHealthScreenInitialPage,
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavDevices,
        activeIcon: ImageConstant.imgNavDevicesWhiteA700,
        title: 'Devices',
        routeName: AppRoutes.familyWiFiManagementScreen,
      ),
      CustomBottomBarItem(
        icon: ImageConstant.imgNavSettings,
        activeIcon: ImageConstant.imgNavSettingsWhiteA700,
        title: 'Settings',
        routeName: AppRoutes.deviceManagementScreen,
      ),
    ];
    notifyListeners();
  }

  void updateSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void selectOverviewTab() {
    isOverviewTabSelected = true;
    isHealthTabSelected = false;
    notifyListeners();
  }

  void selectHealthTab() {
    isOverviewTabSelected = false;
    isHealthTabSelected = true;
    notifyListeners();
  }
}
