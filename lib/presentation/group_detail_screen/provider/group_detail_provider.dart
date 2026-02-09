import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/image_constant.dart';
import '../models/device_item_model.dart';
import '../models/group_detail_model.dart';
import '../models/schedule_item_model.dart';

class GroupDetailProvider extends ChangeNotifier {
  GroupDetailModel groupDetailModel = GroupDetailModel();
  TextEditingController groupNameController = TextEditingController();

  List<DeviceItemModel> devices = [];
  List<ScheduleItemModel> schedules = [];

  @override
  void dispose() {
    groupNameController.dispose();
    super.dispose();
  }

  void initialize() {
    _loadSampleData();
  }

  void _loadSampleData() {
    devices = [
      DeviceItemModel(
        icon: ImageConstant.imgDepth4Frame02,
        title: 'Smart TV',
        subtitle: 'Living Room',
      ),
      DeviceItemModel(
        icon: ImageConstant.imgDepth4Frame03,
        title: 'Tablet',
        subtitle: 'Bedroom',
      ),
      DeviceItemModel(
        icon: ImageConstant.imgDepth4Frame04,
        title: 'Smart Speaker',
        subtitle: 'Kitchen',
      ),
    ];

    schedules = [
      ScheduleItemModel(
        icon: ImageConstant.imgDepth4Frame05,
        title: 'Dinner Time',
        subtitle: 'Weekdays, 6 PM - 10 PM',
      ),
    ];

    notifyListeners();
  }

  void removeDevice(DeviceItemModel device) {
    devices.remove(device);
    notifyListeners();
  }

  void removeSchedule(ScheduleItemModel schedule) {
    schedules.remove(schedule);
    notifyListeners();
  }

  void deleteGroup(BuildContext context) {
    // Handle delete group logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // Modified: Removed const to fix invalid constant error
        content: Text('Group deleted successfully'),
        backgroundColor: Colors
            .red, // Modified: Replaced unavailable theme color with standard color
      ),
    );
    Navigator.pop(context);
  }
}
