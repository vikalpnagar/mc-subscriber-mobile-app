import 'package:flutter/material.dart';
import '../core/app_export.dart';

/**
 * CustomSwitch - A customizable switch component that wraps Flutter's Switch widget
 * 
 * @param value - Current state of the switch (true/false)
 * @param onChanged - Callback function triggered when switch state changes
 * @param activeColor - Color of the switch when it's turned on
 * @param inactiveThumbColor - Color of the thumb when switch is off
 * @param inactiveTrackColor - Color of the track when switch is off
 * @param width - Optional width for the switch container
 * @param height - Optional height for the switch container
 */
class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.width,
    this.height,
  }) : super(key: key);

  /// Current state of the switch
  final bool value;

  /// Callback function when switch state changes
  final Function(bool)? onChanged;

  /// Color when switch is active/on
  final Color? activeColor;

  /// Color of thumb when switch is inactive/off
  final Color? inactiveThumbColor;

  /// Color of track when switch is inactive/off
  final Color? inactiveTrackColor;

  /// Optional width for the switch container
  final double? width;

  /// Optional height for the switch container
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor ?? Theme.of(context).primaryColor,
        inactiveThumbColor: inactiveThumbColor ?? appTheme.grey400,
        inactiveTrackColor: inactiveTrackColor ?? appTheme.grey300,
      ),
    );
  }
}
