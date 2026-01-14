import 'package:flutter/material.dart';
import '../widgets/network_item_widget.dart';

/// This class is used in the [NetworkItemWidget] widget.

// ignore_for_file: must_be_immutable
class NetworkItemModel {
  NetworkItemModel({
    this.title,
    this.subtitle,
    this.value,
    this.onTap,
  }) {
    title = title ?? '';
    subtitle = subtitle ?? '';
    value = value ?? '';
  }

  String? title;
  String? subtitle;
  String? value;
  VoidCallback? onTap;
}
