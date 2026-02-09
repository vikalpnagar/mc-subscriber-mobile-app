import '../widgets/schedule_item_widget.dart';

/// This class is used in the [ScheduleItemWidget] widget.

// ignore_for_file: must_be_immutable
class ScheduleItemModel {
  ScheduleItemModel({
    this.id,
    this.title,
    this.subtitle,
    this.navigateId,
  }) {
    id = id ?? "";
    title = title ?? "";
    subtitle = subtitle ?? "";
    navigateId = navigateId ?? "";
  }

  String? id;
  String? title;
  String? subtitle;
  String? navigateId;
}
