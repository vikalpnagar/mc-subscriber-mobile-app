class HealthStatusItemModel {
  String? icon;
  String? title;
  String? status;

  HealthStatusItemModel({
    this.icon,
    this.title,
    this.status,
  }) {
    icon = icon ?? '';
    title = title ?? '';
    status = status ?? '';
  }
}
