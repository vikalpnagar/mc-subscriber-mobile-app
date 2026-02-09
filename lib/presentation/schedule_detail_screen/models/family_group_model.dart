/// This class is used in the [family_group_item_widget] widget.
class FamilyGroupModel {
  FamilyGroupModel({
    this.icon,
    this.title,
    this.subtitle,
  }) {
    icon = icon ?? '';
    title = title ?? '';
    subtitle = subtitle ?? '';
  }

  String? icon;
  String? title;
  String? subtitle;
}
