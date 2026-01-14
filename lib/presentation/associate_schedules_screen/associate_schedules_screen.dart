import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import './provider/associate_schedules_provider.dart';
import './widgets/schedule_item_widget.dart';

class AssociateSchedulesScreen extends StatefulWidget {
  const AssociateSchedulesScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AssociateSchedulesProvider>(
      create: (context) => AssociateSchedulesProvider(),
      child: const AssociateSchedulesScreen(),
    );
  }

  @override
  State<AssociateSchedulesScreen> createState() =>
      _AssociateSchedulesScreenState();
}

class _AssociateSchedulesScreenState extends State<AssociateSchedulesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AssociateSchedulesProvider>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Associate Schedules',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA70024x24,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: Consumer<AssociateSchedulesProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.h,
                          left: 16.h,
                        ),
                        child: Text(
                          'Select Schedules',
                          style: TextStyleHelper.instance.title18BoldInter
                              .copyWith(
                                  color: appTheme.white_A700, height: 1.22),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.h),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: provider.scheduleItems.length,
                          itemBuilder: (context, index) {
                            return ScheduleItemWidget(
                              scheduleItem: provider.scheduleItems[index],
                              onTap: () =>
                                  provider.toggleScheduleSelection(index),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: double.infinity,
                        color: appTheme.gray_900,
                        margin: EdgeInsets.only(top: 416.h),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: CustomButton(
                  text: 'Save',
                  onPressed: () => provider.saveSchedules(),
                  backgroundColor: appTheme.blue_700,
                  textColor: appTheme.whiteCustom,
                  fontSize: 16.fSize,
                  fontWeight: FontWeight.w700,
                  margin: EdgeInsets.only(bottom: 12.h),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
