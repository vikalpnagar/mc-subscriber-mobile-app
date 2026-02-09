import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomCheckBox - A reusable checkbox component with customizable styling
 * 
 * @param text - The label text displayed next to the checkbox
 * @param value - Boolean value indicating if checkbox is checked
 * @param onChanged - Callback function triggered when checkbox state changes
 * @param textColor - Color of the text label (defaults to white)
 * @param checkColor - Color of the checkmark (defaults to white)
 * @param activeColor - Background color when checkbox is checked (defaults to transparent)
 * @param margin - External spacing around the checkbox component
 */
class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({
    Key? key,
    required this.text,
    required this.value,
    required this.onChanged,
    this.textColor,
    this.checkColor,
    this.activeColor,
    this.margin,
  }) : super(key: key);

  /// The label text displayed next to the checkbox
  final String text;

  /// Boolean value indicating if checkbox is checked
  final bool value;

  /// Callback function triggered when checkbox state changes
  final Function(bool?) onChanged;

  /// Color of the text label
  final Color? textColor;

  /// Color of the checkmark
  final Color? checkColor;

  /// Background color when checkbox is checked
  final Color? activeColor;

  /// External spacing around the checkbox component
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 22.h, left: 16.h),
      child: CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(
          text,
          style: TextStyleHelper.instance.title16RegularInter
              .copyWith(color: textColor ?? Color(0xFFFFFFFF), height: 1.25),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        dense: true,
        checkColor: checkColor ?? Color(0xFFFFFFFF),
        activeColor: activeColor ?? appTheme.transparentCustom,
        side: BorderSide(
          color: appTheme.white_A700,
          width: 2.h,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      ),
    );
  }
}
