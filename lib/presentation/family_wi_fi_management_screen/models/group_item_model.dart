import '../widgets/group_item_widget.dart';

/// This class is used in the [GroupItemWidget] widget.

// ignore_for_file: must_be_immutable
class GroupItemModel {
  GroupItemModel({
    this.id,
    this.imagePath,
    this.title,
    this.deviceCount,
    this.navigateId,
  }) {
    id = id ?? "";
    imagePath = imagePath ?? "";
    title = title ?? "";
    deviceCount = deviceCount ?? "";
    navigateId = navigateId ?? "";
  }

  String? id;
  String? imagePath;
  String? title;
  String? deviceCount;
  String? navigateId;
}
