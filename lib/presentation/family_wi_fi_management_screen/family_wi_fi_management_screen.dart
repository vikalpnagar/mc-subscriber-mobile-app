import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './provider/family_wi_fi_management_provider.dart';
import './widgets/group_item_widget.dart';
import './widgets/schedule_item_widget.dart';

class FamilyWiFiManagementScreen extends StatefulWidget {
  const FamilyWiFiManagementScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<FamilyWiFiManagementProvider>(
      create: (context) => FamilyWiFiManagementProvider()..initialize(),
      child: const FamilyWiFiManagementScreen(),
    );
  }

  @override
  State<FamilyWiFiManagementScreen> createState() =>
      _FamilyWiFiManagementScreenState();
}

class _FamilyWiFiManagementScreenState
    extends State<FamilyWiFiManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Family WiFi',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
        backgroundColor: appTheme.gray_900,
        titleColor: appTheme.white_A700,
      ),
      body: Consumer<FamilyWiFiManagementProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 16.h),
                    child: Text(
                      'Groups',
                      style: TextStyleHelper.instance.title22BoldInter
                          .copyWith(height: 1.23),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 28.h, left: 16.h, right: 42.h),
                    child: Row(
                      spacing: 12.h,
                      children: [
                        ...provider.groups.map(
                          (groupItem) => GroupItemWidget(
                            groupItem: groupItem,
                            onTap: () => provider.onGroupTap(groupItem),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 36.h, left: 16.h),
                    child: Text(
                      'Schedules',
                      style: TextStyleHelper.instance.title22BoldInter
                          .copyWith(height: 1.23),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    child: Column(
                      children: [
                        ...provider.schedules.map(
                          (scheduleItem) => ScheduleItemWidget(
                            scheduleItem: scheduleItem,
                            onTap: () => provider.onScheduleTap(scheduleItem),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 108.h, left: 16.h),
                    child: Row(
                      spacing: 12.h,
                      children: [
                        ElevatedButton(
                          onPressed: () => provider.onAddGroupTap(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appTheme.blue_700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.h),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 10.h,
                            ),
                          ),
                          child: Text(
                            'Add Group',
                            style: TextStyleHelper.instance.body14BoldInter
                                .copyWith(
                                    color: appTheme.white_A700, height: 1.21),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => provider.onAddScheduleTap(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appTheme.blue_gray_900,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.h),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30.h,
                              vertical: 10.h,
                            ),
                          ),
                          child: Text(
                            'Add Schedule',
                            style: TextStyleHelper.instance.body14BoldInter
                                .copyWith(
                                    color: appTheme.white_A700, height: 1.21),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
