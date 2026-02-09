import 'dart:ui';

class SettingModel {
  String label;
  bool isHeader;
  VoidCallback? onTap;

  SettingModel({required this.label, this.isHeader = false, this.onTap});
}
