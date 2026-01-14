import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/add_family_wi_fi_group_provider.dart';
import './widgets/device_item_widget.dart';

class AddFamilyWiFiGroupScreen extends StatefulWidget {
  const AddFamilyWiFiGroupScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddFamilyWiFiGroupProvider>(
      create: (context) => AddFamilyWiFiGroupProvider()..initialize(),
      child: const AddFamilyWiFiGroupScreen(),
    );
  }

  @override
  State<AddFamilyWiFiGroupScreen> createState() =>
      _AddFamilyWiFiGroupScreenState();
}

class _AddFamilyWiFiGroupScreenState extends State<AddFamilyWiFiGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Add Family WiFi Group',
        hasLeading: true,
        leadingIcon: ImageConstant.imgVector0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<AddFamilyWiFiGroupProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomEditText(
                          controller: provider.groupNameController,
                          hintText: 'Group  Name',
                          backgroundColor: appTheme.blue_gray_900,
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32.h, left: 16.h),
                          child: Text(
                            'Select Devices',
                            style: TextStyleHelper.instance.title22BoldInter,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12.h),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: provider.deviceList.length,
                            itemBuilder: (context, index) {
                              return DeviceItemWidget(
                                deviceItem: provider.deviceList[index],
                                onTap: () =>
                                    provider.toggleDeviceSelection(index),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.h),
                child: CustomButton(
                  text: 'Add Group',
                  onPressed: () => provider.addGroup(context),
                  backgroundColor: appTheme.blue_700,
                  width: double.infinity,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
