class ScheduleItemModel {
  String? icon;
  String? title;
  String? subtitle;
  String? id;

  ScheduleItemModel({
    this.icon,
    this.title,
    this.subtitle,
    this.id,
  }) {
    icon = icon ?? '';
    title = title ?? '';
    subtitle = subtitle ?? '';
    id = id ?? '';
  }
}
