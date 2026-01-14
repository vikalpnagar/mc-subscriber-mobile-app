import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/schedule_detail_provider.dart';
import './widgets/family_group_item_widget.dart';

class ScheduleDetailScreen extends StatefulWidget {
  const ScheduleDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ScheduleDetailProvider>(
      create: (context) => ScheduleDetailProvider()..initialize(),
      child: const ScheduleDetailScreen(),
    );
  }

  @override
  State<ScheduleDetailScreen> createState() => _ScheduleDetailScreenState();
}

class _ScheduleDetailScreenState extends State<ScheduleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Schedule Details',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => Navigator.pop(context),
        backgroundColor: appTheme.gray_900,
        titleColor: appTheme.white_A700,
      ),
      body: Consumer<ScheduleDetailProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 12.h, left: 16.h, right: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Schedule Name',
                        style: TextStyleHelper.instance.title16MediumInter,
                      ),
                      SizedBox(height: 8.h),
                      CustomEditText(
                        controller: provider.scheduleNameController,
                        hintText: '',
                        backgroundColor: appTheme.blue_gray_900_01,
                        borderColor: appTheme.blue_gray_700,
                        hasBorder: true,
                        contentPadding: EdgeInsets.all(12.h),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 26.h, left: 16.h, right: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time Range',
                        style: TextStyleHelper.instance.title16MediumInter,
                      ),
                      SizedBox(height: 6.h),
                      CustomEditText(
                        controller: provider.timeRangeController,
                        hintText: '',
                        backgroundColor: appTheme.blue_gray_900_01,
                        borderColor: appTheme.blue_gray_700,
                        hasBorder: true,
                        contentPadding: EdgeInsets.all(12.h),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 26.h, left: 16.h, right: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Days of the Week',
                        style: TextStyleHelper.instance.title16MediumInter,
                      ),
                      SizedBox(height: 6.h),
                      CustomEditText(
                        controller: provider.daysController,
                        hintText: '',
                        backgroundColor: appTheme.blue_gray_900_01,
                        borderColor: appTheme.blue_gray_700,
                        hasBorder: true,
                        contentPadding: EdgeInsets.all(12.h),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24.h, left: 16.h, right: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recurrence',
                        style: TextStyleHelper.instance.title16MediumInter,
                      ),
                      SizedBox(height: 8.h),
                      CustomEditText(
                        controller: provider.recurrenceController,
                        hintText: '',
                        backgroundColor: appTheme.blue_gray_900_01,
                        borderColor: appTheme.blue_gray_700,
                        hasBorder: true,
                        contentPadding: EdgeInsets.all(12.h),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 32.h, left: 16.h),
                  child: Text(
                    'Family WiFi Groups',
                    style: TextStyleHelper.instance.title22BoldInter,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: provider.familyGroups.length,
                    itemBuilder: (context, index) {
                      return FamilyGroupItemWidget(
                        familyGroup: provider.familyGroups[index],
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 136.h, left: 16.h, right: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: 'Delete',
                        onPressed: () => provider.onDeletePressed(context),
                        backgroundColor: appTheme.blue_gray_900,
                        textColor: appTheme.white_A700,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w700,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 12.h),
                      ),
                      CustomButton(
                        text: 'Save',
                        onPressed: () => provider.onSavePressed(context),
                        backgroundColor: appTheme.blue_700,
                        textColor: appTheme.white_A700,
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.w700,
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.h, vertical: 12.h),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  height: 20.h,
                  width: double.infinity,
                  color: appTheme.gray_900,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
