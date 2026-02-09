import '../models/group_selection_model.dart';

import 'package:flutter/material.dart';

import '../models/group_item_model.dart';

import '../../../core/app_export.dart';

class GroupSelectionProvider extends ChangeNotifier {
  GroupSelectionModel groupSelectionModel = GroupSelectionModel();

  List<GroupItemModel> _groups = [];

  List<GroupItemModel> get groups => _groups;

  void initialize() {
    _groups = [
      GroupItemModel(
        id: '1',
        name: 'Kids',
        deviceCount: '2 devices',
        isSelected: false,
      ),
      GroupItemModel(
        id: '2',
        name: 'Guests',
        deviceCount: '1 device',
        isSelected: false,
      ),
      GroupItemModel(
        id: '3',
        name: 'Parents',
        deviceCount: '3 devices',
        isSelected: false,
      ),
    ];
    notifyListeners();
  }

  void toggleGroupSelection(int index) {
    if (index >= 0 && index < _groups.length) {
      _groups[index] = _groups[index].copyWith(
        isSelected: !(_groups[index].isSelected ?? false),
      );
      notifyListeners();
    }
  }

  void saveSelection(BuildContext context) {
    List<GroupItemModel> selectedGroups =
        _groups.where((group) => group.isSelected ?? false).toList();

    if (selectedGroups.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${selectedGroups.length} groups selected'),
          backgroundColor: appTheme.blue_700,
        ),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select at least one group'),
          backgroundColor: appTheme.redCustom,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
