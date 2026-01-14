class ScheduleItemModel {
  String? id;
  String? title;
  String? subtitle;
  String? iconPath;
  bool? isSelected;

  ScheduleItemModel({
    this.id,
    this.title,
    this.subtitle,
    this.iconPath,
    this.isSelected,
  }) {
    id = id ?? '';
    title = title ?? '';
    subtitle = subtitle ?? '';
    iconPath = iconPath ?? 'assets/images/img_depth_4_frame_0_48x48.svg';
    isSelected = isSelected ?? false;
  }

  ScheduleItemModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? iconPath,
    bool? isSelected,
  }) {
    return ScheduleItemModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      iconPath: iconPath ?? this.iconPath,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
