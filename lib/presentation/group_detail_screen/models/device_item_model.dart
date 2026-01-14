class DeviceItemModel {
  String? icon;
  String? title;
  String? subtitle;
  String? id;

  DeviceItemModel({
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
