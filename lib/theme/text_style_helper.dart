import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline32BoldInter => TextStyle(
        fontSize: 32.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: appTheme.white_A700,
      );

  TextStyle get headline28BoldInter => TextStyle(
        fontSize: 28.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: appTheme.white_A700,
      );

  TextStyle get headline24BoldInter => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: appTheme.white_A700,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title22BoldInter => TextStyle(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: appTheme.white_A700,
      );

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title18BoldInter => TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
      );

  TextStyle get title16RegularInter => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      );

  TextStyle get title16MediumInter => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: appTheme.white_A700,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body14RegularInter => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: appTheme.indigo_200,
      );

  TextStyle get body14BoldInter => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
      );

  TextStyle get body14MediumInter => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        color: appTheme.white_A700,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12.fSize,
        color: appTheme.indigo_200,
      );

  TextStyle get body12MediumInter => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get bodyTextInter => TextStyle(
        fontFamily: 'Inter',
      );
}
