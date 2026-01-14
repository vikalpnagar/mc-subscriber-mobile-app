/// This class is used in the [NewScheduleCreationScreen] screen.

// ignore_for_file: must_be_immutable
class NewScheduleCreationModel {
  NewScheduleCreationModel({
    this.scheduleName,
    this.startTime,
    this.endTime,
    this.recurrenceType,
    this.selectedDays,
  }) {
    scheduleName = scheduleName ?? '';
    startTime = startTime ?? '';
    endTime = endTime ?? '';
    recurrenceType = recurrenceType ?? 'All week';
    selectedDays = selectedDays ?? [];
  }

  String? scheduleName;
  String? startTime;
  String? endTime;
  String? recurrenceType;
  List<String>? selectedDays;

  NewScheduleCreationModel copyWith({
    String? scheduleName,
    String? startTime,
    String? endTime,
    String? recurrenceType,
    List<String>? selectedDays,
  }) {
    return NewScheduleCreationModel(
      scheduleName: scheduleName ?? this.scheduleName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      recurrenceType: recurrenceType ?? this.recurrenceType,
      selectedDays: selectedDays ?? this.selectedDays,
    );
  }
}

// ignore_for_file: must_be_immutable
class DayModel {
  DayModel({
    this.name,
    this.isSelected,
  }) {
    name = name ?? '';
    isSelected = isSelected ?? false;
  }

  String? name;
  bool? isSelected;

  DayModel copyWith({
    String? name,
    bool? isSelected,
  }) {
    return DayModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
