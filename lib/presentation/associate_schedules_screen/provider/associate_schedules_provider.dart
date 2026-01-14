import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/associate_schedules_model.dart';
import '../models/schedule_item_model.dart';

class AssociateSchedulesProvider extends ChangeNotifier {
  AssociateSchedulesModel associateSchedulesModel = AssociateSchedulesModel();
  List<ScheduleItemModel> scheduleItems = [];
  bool isLoading = false;

  void initialize() {
    scheduleItems = [
      ScheduleItemModel(
        id: '1',
        title: 'Weekdays',
        subtitle: 'Mon, Tue, Wed, Thu, Fri',
        iconPath: ImageConstant.imgDepth4Frame048x48,
        isSelected: false,
      ),
      ScheduleItemModel(
        id: '2',
        title: 'Weekends',
        subtitle: 'Sat, Sun',
        iconPath: ImageConstant.imgDepth4Frame048x48,
        isSelected: false,
      ),
      ScheduleItemModel(
        id: '3',
        title: 'School Days',
        subtitle: 'Mon, Tue, Wed, Thu, Fri',
        iconPath: ImageConstant.imgDepth4Frame048x48,
        isSelected: false,
      ),
      ScheduleItemModel(
        id: '4',
        title: 'Vacation',
        subtitle: 'Sat, Sun',
        iconPath: ImageConstant.imgDepth4Frame048x48,
        isSelected: false,
      ),
    ];
    notifyListeners();
  }

  void toggleScheduleSelection(int index) {
    if (index >= 0 && index < scheduleItems.length) {
      scheduleItems[index] = scheduleItems[index].copyWith(
        isSelected: !(scheduleItems[index].isSelected ?? false),
      );
      notifyListeners();
    }
  }

  Future<void> saveSchedules() async {
    isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(Duration(seconds: 1));

    List<ScheduleItemModel> selectedSchedules =
        scheduleItems.where((item) => item.isSelected ?? false).toList();

    // Handle save logic here
    print('Selected schedules: ${selectedSchedules.length}');

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
