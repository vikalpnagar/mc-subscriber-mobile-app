import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomIconButton is a reusable icon button component with customizable appearance.
 * 
 * This widget provides a consistent icon button design with rounded corners,
 * background color, and flexible sizing options. It supports different icon assets
 * and tap interactions while maintaining responsive design principles.
 * 
 * @param iconPath - Path to the SVG icon asset
 * @param onTap - Callback function triggered when button is tapped
 * @param height - Height of the button (defaults to 48.h)
 * @param width - Width of the button (defaults to 48.h)
 * @param padding - Internal padding around the icon (defaults to 12.h)
 * @param backgroundColor - Background color of the button
 * @param borderRadius - Corner radius of the button
 */
class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.iconPath,
    this.onTap,
    this.height,
    this.width,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  /// Path to the SVG icon asset
  final String? iconPath;

  /// Callback function triggered when button is tapped
  final VoidCallback? onTap;

  /// Height of the button
  final double? height;

  /// Width of the button
  final double? width;

  /// Internal padding around the icon
  final double? padding;

  /// Background color of the button
  final Color? backgroundColor;

  /// Corner radius of the button
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final buttonHeight = height ?? 48.h;
    final buttonWidth = width ?? 48.h;
    final buttonPadding = padding ?? 12.h;
    final buttonBackgroundColor = backgroundColor ?? Color(0xFF233547);
    final buttonBorderRadius = borderRadius ?? 8.h;

    return Container(
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
        color: buttonBackgroundColor,
        borderRadius: BorderRadius.circular(buttonBorderRadius),
      ),
      child: Material(
        color: appTheme.transparentCustom,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(buttonBorderRadius),
          child: Padding(
            padding: EdgeInsets.all(buttonPadding),
            child: iconPath != null
                ? CustomImageView(
                    imagePath: iconPath!,
                    fit: BoxFit.contain,
                  )
                : SizedBox(),
          ),
        ),
      ),
    );
  }
}
