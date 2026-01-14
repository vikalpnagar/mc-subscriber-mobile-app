import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_icon_button.dart';
import './provider/group_detail_provider.dart';
import './widgets/device_item_widget.dart';
import './widgets/schedule_item_widget.dart';

class GroupDetailScreen extends StatefulWidget {
  const GroupDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<GroupDetailProvider>(
      create: (context) => GroupDetailProvider()..initialize(),
      child: const GroupDetailScreen(),
    );
  }

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      body: Consumer<GroupDetailProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              CustomAppBar(
                title: 'Group Details',
                hasLeading: true,
                leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
                onLeadingPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Column(
                  children: [
                    _buildGroupNameSection(provider),
                    _buildDevicesSection(provider),
                    _buildSchedulesSection(provider),
                    Expanded(child: Container()),
                    _buildDeleteButton(provider),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGroupNameSection(GroupDetailProvider provider) {
    return Container(
      margin: EdgeInsets.only(
        top: 14.h,
        left: 16.h,
        right: 16.h,
      ),
      child: Column(
        spacing: 6.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Group Name',
            style: TextStyleHelper.instance.title16MediumInter
                .copyWith(height: 1.25),
          ),
          CustomEditText(
            controller: provider.groupNameController,
            hintText: '',
            backgroundColor: appTheme.blue_gray_900_01,
            borderColor: appTheme.blue_gray_700,
            hasBorder: true,
          ),
        ],
      ),
    );
  }

  Widget _buildDevicesSection(GroupDetailProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 28.h,
            left: 16.h,
          ),
          child: Text(
            'Devices',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700, height: 1.22),
          ),
        ),
        SizedBox(height: 8.h),
        ...provider.devices.map((device) => DeviceItemWidget(device: device)),
        _buildAddDeviceItem(),
      ],
    );
  }

  Widget _buildAddDeviceItem() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.h,
      ),
      color: appTheme.gray_900,
      child: Row(
        children: [
          CustomIconButton(
            iconPath: ImageConstant.imgDepth3Frame0,
            height: 40.h,
            width: 40.h,
            padding: 8.h,
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
          ),
          SizedBox(width: 16.h),
          Text(
            'Add Device',
            style: TextStyleHelper.instance.title16RegularInter
                .copyWith(color: appTheme.white_A700, height: 1.25),
          ),
        ],
      ),
    );
  }

  Widget _buildSchedulesSection(GroupDetailProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 16.h,
            left: 16.h,
          ),
          child: Text(
            'Schedules',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700, height: 1.22),
          ),
        ),
        SizedBox(height: 8.h),
        ...provider.schedules
            .map((schedule) => ScheduleItemWidget(schedule: schedule)),
        _buildAddScheduleItem(),
      ],
    );
  }

  Widget _buildAddScheduleItem() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 8.h,
      ),
      color: appTheme.gray_900,
      child: Row(
        children: [
          CustomIconButton(
            iconPath: ImageConstant.imgDepth3Frame0,
            height: 40.h,
            width: 40.h,
            padding: 8.h,
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
          ),
          SizedBox(width: 16.h),
          Text(
            'Add Schedule',
            style: TextStyleHelper.instance.title16RegularInter
                .copyWith(color: appTheme.white_A700, height: 1.25),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton(GroupDetailProvider provider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomButton(
        text: 'Delete Group',
        onPressed: () => provider.deleteGroup(context),
        backgroundColor: appTheme.blue_gray_900,
        textColor: appTheme.white_A700,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w700,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(
          horizontal: 30.h,
          vertical: 10.h,
        ),
      ),
    );
  }
}
