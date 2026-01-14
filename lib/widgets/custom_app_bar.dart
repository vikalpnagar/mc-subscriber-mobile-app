import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomAppBar - A reusable app bar component with customizable title and optional leading icon
 * 
 * @param title - The main title text to display in the app bar
 * @param hasLeading - Whether to show the leading back/navigation icon
 * @param leadingIcon - Path to the SVG icon for the leading button
 * @param onLeadingPressed - Callback function when leading icon is tapped
 * @param backgroundColor - Background color of the app bar
 * @param titleColor - Color of the title text
 * @param centerTitle - Whether to center the title text
 * @param actions - Actions to display on right of app bar
 */
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.title,
    this.hasLeading,
    this.leadingIcon,
    this.onLeadingPressed,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle,
    this.actions,
  }) : super(key: key);

  /// The main title text displayed in the app bar
  final String title;

  /// Whether to show the leading back/navigation icon
  final bool? hasLeading;

  /// Path to the SVG icon for the leading button
  final String? leadingIcon;

  /// Callback function triggered when leading icon is tapped
  final VoidCallback? onLeadingPressed;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Color of the title text
  final Color? titleColor;

  /// Whether to center the title text
  final bool? centerTitle;

  /// Whether to center the title text
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Color(0xFF111921),
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle ?? false,
      leading: _buildLeading(context), // Modified: Added context parameter
      title: _buildTitle(),
      titleSpacing: hasLeading ?? true ? 12.h : 16.h,
      actions: actions,
    );
  }

  /// Builds the leading icon widget
  Widget? _buildLeading(BuildContext context) {
    // Modified: Added context parameter
    if (!(hasLeading ?? true)) return null;

    return GestureDetector(
      onTap:
          onLeadingPressed ??
          () => Navigator.of(
            context,
          ).pop(), // Modified: Replaced Get.context! with context
      child: Container(
        padding: EdgeInsets.all(12.h),
        child: CustomImageView(
          imagePath: leadingIcon ?? ImageConstant.imgDepth4Frame0WhiteA700,
          height: 24.h,
          width: 24.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /// Builds the title text widget
  Widget _buildTitle() {
    return Text(
      title,
      style: TextStyleHelper.instance.title18BoldInter.copyWith(
        color: titleColor ?? Color(0xFFFFFFFF),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(68.h);
}
