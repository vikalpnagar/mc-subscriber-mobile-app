import 'package:family_wifi/core/utils/image_constant.dart';

/// Item data model for custom bottom bar navigation
class BottomBarItem {
  const BottomBarItem({
    required this.index,
    required this.label,
    required this.icon,
    required this.appBarTitle,
    required this.appBarHasLeading,
    required this.appBarHasTrailing,
  });

  /// Index of the item
  final int index;

  /// Path to the inactive state icon
  final String icon;

  /// Label text shown below the icon
  final String label;

  /// Title for App Bar
  final String appBarTitle;

  /// Show leading icon
  final bool appBarHasLeading;

  /// Show trailing icon
  final bool appBarHasTrailing;
}

final List<BottomBarItem> NAV_BOTTOM_BAR_ITEMS = [
  new BottomBarItem(
    index: 0,
    label: 'Dashboard',
    icon: ImageConstant.imgNavDashboard,
    appBarTitle: 'Home',
    appBarHasLeading: false,
    appBarHasTrailing: true,
  ),
  new BottomBarItem(
    index: 1,
    label: 'Devices',
    icon: ImageConstant.imgNavDevices,
    appBarTitle: 'Devices',
    appBarHasLeading: true,
    appBarHasTrailing: false,
  ),
  new BottomBarItem(
    index: 2,
    label: 'Settings',
    icon: ImageConstant.imgNavSettings,
    appBarTitle: 'Settings',
    appBarHasLeading: true,
    appBarHasTrailing: false,
  ),
];
