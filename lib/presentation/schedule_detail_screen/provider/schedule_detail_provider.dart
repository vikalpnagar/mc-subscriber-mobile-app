import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/family_group_model.dart';

class ScheduleDetailProvider extends ChangeNotifier {
  TextEditingController scheduleNameController = TextEditingController();
  TextEditingController timeRangeController = TextEditingController();
  TextEditingController daysController = TextEditingController();
  TextEditingController recurrenceController = TextEditingController();

  List<FamilyGroupModel> familyGroups = [];
  bool isLoading = false;
  bool isSaved = false;

  @override
  void dispose() {
    scheduleNameController.dispose();
    timeRangeController.dispose();
    daysController.dispose();
    recurrenceController.dispose();
    super.dispose();
  }

  void initialize() {
    familyGroups = [
      FamilyGroupModel(
        icon: ImageConstant.imgDepth3Frame02,
        title: 'Kids',
        subtitle: '2 devices',
      ),
      FamilyGroupModel(
        icon: ImageConstant.imgDepth3Frame02,
        title: 'Parents',
        subtitle: '3 devices',
      ),
    ];
    notifyListeners();
  }

  void onDeletePressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Schedule deleted successfully')),
    );
    Navigator.pop(context);
  }

  void onSavePressed(BuildContext context) {
    isSaved = true;
    notifyListeners();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Schedule saved successfully')),
    );
  }
}
