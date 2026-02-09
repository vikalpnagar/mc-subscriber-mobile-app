import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_check_box.dart';
import '../../widgets/custom_edit_text.dart';
import './models/new_schedule_creation_model.dart';
import './provider/new_schedule_creation_provider.dart';

class NewScheduleCreationScreen extends StatefulWidget {
  const NewScheduleCreationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<NewScheduleCreationProvider>(
      create: (context) => NewScheduleCreationProvider(),
      child: const NewScheduleCreationScreen(),
    );
  }

  @override
  State<NewScheduleCreationScreen> createState() =>
      _NewScheduleCreationScreenState();
}

class _NewScheduleCreationScreenState extends State<NewScheduleCreationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewScheduleCreationProvider>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'New schedule',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA70024x24,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<NewScheduleCreationProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildScheduleNameSection(provider),
                      _buildTimeSection(provider),
                      _buildRecurrenceSection(provider),
                      _buildDaysSection(provider),
                      SizedBox(height: 82.h),
                    ],
                  ),
                ),
              ),
              _buildSaveButton(provider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildScheduleNameSection(NewScheduleCreationProvider provider) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomEditText(
        hintText: 'Schedule name',
        controller: provider.scheduleNameController,
        backgroundColor: appTheme.blue_gray_900,
      ),
    );
  }

  Widget _buildTimeSection(NewScheduleCreationProvider provider) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 28.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          Text(
            'Time',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700),
          ),
          Row(
            spacing: 16.h,
            children: [
              Expanded(
                child: CustomEditText(
                  hintText: 'Start time',
                  inputType: CustomInputType.time,
                  controller: provider.startTimeController,
                  backgroundColor: appTheme.blue_gray_900,
                  readOnly: true,
                  onTap: () => provider.selectStartTime(context),
                ),
              ),
              Expanded(
                child: CustomEditText(
                  hintText: 'End time',
                  inputType: CustomInputType.time,
                  controller: provider.endTimeController,
                  backgroundColor: appTheme.blue_gray_900,
                  readOnly: true,
                  onTap: () => provider.selectEndTime(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecurrenceSection(NewScheduleCreationProvider provider) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 28.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24.h,
        children: [
          Text(
            'Recurrence',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700),
          ),
          Wrap(
            spacing: 16.h,
            runSpacing: 16.h,
            children: provider.recurrenceOptions.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              bool isSelected = provider.selectedRecurrenceIndex == index;

              return GestureDetector(
                onTap: () => provider.selectRecurrenceOption(index),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    border: Border.all(
                      color: isSelected
                          ? appTheme.white_A700
                          : appTheme.blue_gray_700,
                      width: 1.h,
                    ),
                    color: isSelected
                        ? appTheme.blue_gray_700
                        : appTheme.transparentCustom,
                  ),
                  child: Text(
                    option,
                    style: TextStyleHelper.instance.body14MediumInter,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDaysSection(NewScheduleCreationProvider provider) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.h, 32.h, 16.h, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Days',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700),
          ),
          SizedBox(height: 20.h),
          ...provider.daysModel.asMap().entries.map((entry) {
            int index = entry.key;
            DayModel day = entry.value;

            return CustomCheckBox(
              text: day.name ?? '',
              value: day.isSelected ?? false,
              onChanged: (value) => provider.toggleDay(index, value ?? false),
              margin: EdgeInsets.only(top: index == 0 ? 0 : 22.h),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildSaveButton(NewScheduleCreationProvider provider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
      child: CustomButton(
        text: 'Save',
        onPressed: () => provider.saveSchedule(context),
        backgroundColor: appTheme.blue_700,
        width: double.infinity,
      ),
    );
  }
}
