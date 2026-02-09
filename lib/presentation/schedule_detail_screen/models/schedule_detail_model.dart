/// This class is used in the [schedule_detail_screen] screen.
class ScheduleDetailModel {
  ScheduleDetailModel({
    this.scheduleName,
    this.timeRange,
    this.daysOfWeek,
    this.recurrence,
  }) {
    scheduleName = scheduleName ?? '';
    timeRange = timeRange ?? '';
    daysOfWeek = daysOfWeek ?? '';
    recurrence = recurrence ?? '';
  }

  String? scheduleName;
  String? timeRange;
  String? daysOfWeek;
  String? recurrence;
}
