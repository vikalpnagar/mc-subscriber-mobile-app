import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomBar - A customizable bottom navigation bar component
 * 
 * Features:
 * - Three navigation items with icons and labels
 * - Active/inactive state management
 * - Custom styling with dark theme
 * - Navigation callback support
 * - Responsive design with SizeUtils
 * 
 * @param bottomBarItemList List of navigation items with their properties
 * @param selectedIndex Current selected tab index (default: 0)
 * @param onChanged Callback function when navigation item is tapped
 * @param backgroundColor Background color of the bottom bar
 * @param borderColor Top border color of the bottom bar
 * @param activeTextColor Text color for active navigation item
 * @param inactiveTextColor Text color for inactive navigation items
 */
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
    this.backgroundColor,
    this.borderColor,
    this.activeTextColor,
    this.inactiveTextColor,
  }) : super(key: key);

  /// List of bottom bar items with their properties
  final List<CustomBottomBarItem> bottomBarItemList;

  /// Current selected index of the bottom bar
  final int selectedIndex;

  /// Callback function triggered when a bottom bar item is tapped
  final Function(int) onChanged;

  /// Background color of the bottom bar
  final Color? backgroundColor;

  /// Top border color of the bottom bar
  final Color? borderColor;

  /// Text color for active navigation item
  final Color? activeTextColor;

  /// Text color for inactive navigation items
  final Color? inactiveTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFF192633),
        border: Border(
          top: BorderSide(
            color: borderColor ?? Color(0xFF233547),
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 40.h,
              vertical: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                bottomBarItemList.length,
                (index) {
                  final isSelected = selectedIndex == index;
                  final item = bottomBarItemList[index];

                  return InkWell(
                    onTap: () => onChanged(index),
                    child: _buildBottomBarItem(item, isSelected),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 20.h,
            color: backgroundColor ?? Color(0xFF192633),
          ),
        ],
      ),
    );
  }

  /// Builds individual bottom bar navigation item
  Widget _buildBottomBarItem(CustomBottomBarItem item, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.h),
          child: CustomImageView(
            imagePath: isSelected ? item.activeIcon : item.icon,
            height: 24.h,
            width: 24.h,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          item.title,
          style: TextStyleHelper.instance.body12MediumInter.copyWith(
              color: isSelected
                  ? (activeTextColor ?? Color(0xFFFFFFFF))
                  : (inactiveTextColor ?? Color(0xFF91ADC9)),
              height: 1.25),
        ),
      ],
    );
  }
}

/// Item data model for custom bottom bar navigation
class CustomBottomBarItem {
  CustomBottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
    required this.routeName,
  });

  /// Path to the inactive state icon
  final String icon;

  /// Path to the active state icon
  final String activeIcon;

  /// Title text shown below the icon
  final String title;

  /// Route name for navigation
  final String routeName;
}
