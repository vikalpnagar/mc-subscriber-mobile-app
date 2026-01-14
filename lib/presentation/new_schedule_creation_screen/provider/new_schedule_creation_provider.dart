import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/new_schedule_creation_model.dart';

class NewScheduleCreationProvider extends ChangeNotifier {
  NewScheduleCreationModel newScheduleCreationModel =
      NewScheduleCreationModel();

  TextEditingController scheduleNameController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  List<String> recurrenceOptions = [
    'All week',
    'Weekdays',
    'Weekends',
    'Custom'
  ];
  int selectedRecurrenceIndex = 0;

  List<DayModel> daysModel = [];

  @override
  void dispose() {
    scheduleNameController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    super.dispose();
  }

  void initialize() {
    _initializeDays();
    _setDefaultRecurrence();
    notifyListeners();
  }

  void _initializeDays() {
    daysModel = [
      DayModel(name: 'Sunday', isSelected: false),
      DayModel(name: 'Monday', isSelected: true),
      DayModel(name: 'Tuesday', isSelected: true),
      DayModel(name: 'Wednesday', isSelected: true),
      DayModel(name: 'Thursday', isSelected: true),
      DayModel(name: 'Friday', isSelected: true),
      DayModel(name: 'Saturday', isSelected: false),
    ];
  }

  void _setDefaultRecurrence() {
    selectedRecurrenceIndex = 1; // Default to "Weekdays"
  }

  void selectRecurrenceOption(int index) {
    selectedRecurrenceIndex = index;

    // Update days based on recurrence selection
    switch (index) {
      case 0: // All week
        _selectAllDays();
        break;
      case 1: // Weekdays
        _selectWeekdays();
        break;
      case 2: // Weekends
        _selectWeekends();
        break;
      case 3: // Custom
        // Keep current selection for custom
        break;
    }
    notifyListeners();
  }

  void _selectAllDays() {
    for (int i = 0; i < daysModel.length; i++) {
      daysModel[i] = daysModel[i].copyWith(isSelected: true);
    }
  }

  void _selectWeekdays() {
    for (int i = 0; i < daysModel.length; i++) {
      // Monday to Friday (indexes 1-5)
      bool isWeekday = i >= 1 && i <= 5;
      daysModel[i] = daysModel[i].copyWith(isSelected: isWeekday);
    }
  }

  void _selectWeekends() {
    for (int i = 0; i < daysModel.length; i++) {
      // Sunday (index 0) and Saturday (index 6)
      bool isWeekend = i == 0 || i == 6;
      daysModel[i] = daysModel[i].copyWith(isSelected: isWeekend);
    }
  }

  void toggleDay(int index, bool value) {
    if (index >= 0 && index < daysModel.length) {
      daysModel[index] = daysModel[index].copyWith(isSelected: value);

      // If manually changing days, switch to Custom
      selectedRecurrenceIndex = 3;
      notifyListeners();
    }
  }

  Future<void> selectStartTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: appTheme
                  .blue_700, // Modified: Replaced unavailable theme color
              surface: appTheme
                  .blue_gray_900, // Modified: Replaced unavailable theme color
              onSurface: appTheme
                  .white_A700, // Modified: Replaced unavailable theme color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      startTimeController.text = picked.format(context);
      newScheduleCreationModel =
          newScheduleCreationModel.copyWith(startTime: picked.format(context));
      notifyListeners();
    }
  }

  Future<void> selectEndTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: appTheme
                  .blue_700, // Modified: Replaced unavailable theme color
              surface: appTheme
                  .blue_gray_900, // Modified: Replaced unavailable theme color
              onSurface: appTheme
                  .white_A700, // Modified: Replaced unavailable theme color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      endTimeController.text = picked.format(context);
      newScheduleCreationModel =
          newScheduleCreationModel.copyWith(endTime: picked.format(context));
      notifyListeners();
    }
  }

  bool _validateSchedule() {
    if (scheduleNameController.text.trim().isEmpty) {
      return false;
    }

    if (startTimeController.text.trim().isEmpty ||
        endTimeController.text.trim().isEmpty) {
      return false;
    }

    bool anyDaySelected = daysModel.any((day) => day.isSelected ?? false);
    if (!anyDaySelected) {
      return false;
    }

    return true;
  }

  void saveSchedule(BuildContext context) {
    if (!_validateSchedule()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Please fill all required fields and select at least one day'),
          backgroundColor:
              appTheme.colorFFF443, // Modified: Replaced unavailable theme color
        ),
      );
      return;
    }

    // Update model with current values
    newScheduleCreationModel = newScheduleCreationModel.copyWith(
      scheduleName: scheduleNameController.text.trim(),
      startTime: startTimeController.text,
      endTime: endTimeController.text,
      recurrenceType: recurrenceOptions[selectedRecurrenceIndex],
      selectedDays: daysModel
          .where((day) => day.isSelected ?? false)
          .map((day) => day.name ?? '')
          .toList(),
    );

    // Clear form after successful save
    _clearForm();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Schedule saved successfully!'),
        backgroundColor:
            appTheme.colorFF4CAF, // Modified: Replaced unavailable theme color
      ),
    );

    // Navigate back
    NavigatorService.goBack();
  }

  void _clearForm() {
    scheduleNameController.clear();
    startTimeController.clear();
    endTimeController.clear();
    selectedRecurrenceIndex = 0;
    _initializeDays();
    newScheduleCreationModel = NewScheduleCreationModel();
    notifyListeners();
  }
}