import 'package:flutter/material.dart';

import '../core/app_export.dart';

/**
 * CustomEditText - A flexible and reusable text input field component
 * 
 * Supports various input types including text, email, password, and time inputs
 * with customizable styling, validation, and responsive design.
 * 
 * @param controller TextEditingController for managing text input
 * @param hintText Placeholder text displayed when field is empty
 * @param inputType Type of input (text, email, password, time)
 * @param backgroundColor Background color of the input field
 * @param borderColor Color of the input field border
 * @param hasBorder Whether to show border around the input field
 * @param contentPadding Padding inside the input field
 * @param margin Margin around the input field
 * @param width Width of the input field
 * @param validator Function to validate input text
 * @param onTap Callback function when field is tapped
 * @param readOnly Whether the field is read-only
 */
class CustomEditText extends StatefulWidget {
  CustomEditText({
    Key? key,
    this.controller,
    this.hintText,
    this.inputType = CustomInputType.text,
    this.backgroundColor,
    this.borderColor,
    this.hasBorder = false,
    this.contentPadding,
    this.margin,
    this.width,
    this.validator,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  /// Controller for managing the text input
  final TextEditingController? controller;

  /// Placeholder text shown when field is empty
  final String? hintText;

  /// Type of input field determining keyboard type and behavior
  final CustomInputType inputType;

  /// Background color of the input field
  final Color? backgroundColor;

  /// Color of the input field border
  final Color? borderColor;

  /// Whether to show border around the input field
  final bool hasBorder;

  /// Padding inside the input field
  final EdgeInsetsGeometry? contentPadding;

  /// Margin around the input field
  final EdgeInsetsGeometry? margin;

  /// Width of the input field
  final double? width;

  /// Function to validate input text
  final String? Function(String?)? validator;

  /// Callback function when field is tapped
  final VoidCallback? onTap;

  /// Whether the field is read-only
  final bool readOnly;

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  late bool _isPasswordHidden;

  @override
  void initState() {
    super.initState();
    _isPasswordHidden = widget.inputType == CustomInputType.password;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: widget.margin ?? EdgeInsets.zero,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isPasswordHidden,
        keyboardType: _getKeyboardType(),
        validator: widget.validator,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        style: TextStyleHelper.instance.title16RegularInter
            .copyWith(color: appTheme.indigo_200, height: 1.5),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyleHelper.instance.title16RegularInter
              .copyWith(color: appTheme.indigo_200, height: 1.5),
          filled: true,
          fillColor: widget.backgroundColor ?? Color(0xFF233547),
          contentPadding: widget.contentPadding ?? EdgeInsets.all(16.h),
          border: _buildBorder(),
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
          errorBorder: _buildBorder(isError: true),
          focusedErrorBorder: _buildBorder(isError: true),
          suffixIcon: _buildSuffixIcon(),
        ),
      ),
    );
  }

  /// Get appropriate keyboard type based on input type
  TextInputType _getKeyboardType() {
    switch (widget.inputType) {
      case CustomInputType.email:
        return TextInputType.emailAddress;
      case CustomInputType.password:
        return TextInputType.visiblePassword;
      case CustomInputType.time:
        return TextInputType.datetime;
      case CustomInputType.text:
      default:
        return TextInputType.text;
    }
  }

  /// Build input border based on configuration
  InputBorder _buildBorder({bool isError = false}) {
    if (widget.hasBorder) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide(
          color: isError
              ? appTheme.redCustom
              : widget.borderColor ?? Color(0xFF334C66),
          width: 1.0,
        ),
      );
    } else {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.h),
        borderSide: BorderSide.none,
      );
    }
  }

  /// Build suffix icon for password fields
  Widget? _buildSuffixIcon() {
    if (widget.inputType == CustomInputType.password) {
      return IconButton(
        icon: Icon(
          _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
          color: appTheme.indigo_200,
        ),
        onPressed: () {
          setState(() {
            _isPasswordHidden = !_isPasswordHidden;
          });
        },
      );
    }
    return null;
  }
}

/// Enum defining different input types for CustomEditText
enum CustomInputType {
  text,
  email,
  password,
  time,
}
