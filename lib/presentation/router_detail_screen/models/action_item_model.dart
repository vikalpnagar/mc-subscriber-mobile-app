/// This class is used in the [action_item_widget] widget.

// ignore_for_file: must_be_immutable
class ActionItemModel {
  ActionItemModel({
    this.icon,
    this.title,
    this.actionType,
    this.id,
  }) {
    icon = icon ?? 'assets/images/img_depth_3_frame_0_white_a700_40x40.svg';
    title = title ?? 'Action';
    actionType = actionType ?? 'default';
    id = id ?? '';
  }

  String? icon;
  String? title;
  String? actionType;
  String? id;
}
