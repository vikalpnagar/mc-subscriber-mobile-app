class AssociateSchedulesModel {
  String? title;
  bool? hasSelectedSchedules;

  AssociateSchedulesModel({
    this.title,
    this.hasSelectedSchedules,
  }) {
    title = title ?? 'Associate Schedules';
    hasSelectedSchedules = hasSelectedSchedules ?? false;
  }

  AssociateSchedulesModel copyWith({
    String? title,
    bool? hasSelectedSchedules,
  }) {
    return AssociateSchedulesModel(
      title: title ?? this.title,
      hasSelectedSchedules: hasSelectedSchedules ?? this.hasSelectedSchedules,
    );
  }
}
