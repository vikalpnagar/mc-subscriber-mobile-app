import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/family_wi_fi_management_model.dart';
import '../models/group_item_model.dart';
import '../models/schedule_item_model.dart';

class FamilyWiFiManagementProvider extends ChangeNotifier {
  FamilyWiFiManagementModel familyWiFiManagementModel =
      FamilyWiFiManagementModel();

  List<GroupItemModel> groups = [];
  List<ScheduleItemModel> schedules = [];

  void initialize() {
    groups = [
      GroupItemModel(
        id: '1',
        imagePath: ImageConstant.imgDepth5Frame0160x160,
        title: 'Family',
        deviceCount: '3 devices',
        navigateId: '47:106',
      ),
      GroupItemModel(
        id: '2',
        imagePath: ImageConstant.imgDepth5Frame01,
        title: 'Friends',
        deviceCount: '2 devices',
        navigateId: '47:106',
      ),
    ];

    schedules = [
      ScheduleItemModel(
        id: '1',
        title: 'School Night',
        subtitle: '10:00 PM - 7:00 AM · Mon, Tue, Wed, Thu, Fri',
        navigateId: '2:544',
      ),
      ScheduleItemModel(
        id: '2',
        title: 'Weekend',
        subtitle: '11:00 PM - 8:00 AM · Sat, Sun',
        navigateId: '',
      ),
    ];
  }

  void onGroupTap(GroupItemModel group) {
    if (group.navigateId?.isNotEmpty ?? false) {
      NavigatorService.pushNamed(AppRoutes.groupDetailScreen);
    }
  }

  void onScheduleTap(ScheduleItemModel schedule) {
    if (schedule.navigateId?.isNotEmpty ?? false) {
      NavigatorService.pushNamed(AppRoutes.scheduleDetailScreen);
    }
  }

  void onAddGroupTap() {
    NavigatorService.pushNamed(AppRoutes.addFamilyWiFiGroupScreen);
  }

  void onAddScheduleTap() {
    // Navigate to schedule creation screen (not defined in current AppRoutes)
  }
}
