import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import './provider/group_selection_provider.dart';

class GroupSelectionScreen extends StatefulWidget {
  const GroupSelectionScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<GroupSelectionProvider>(
      create: (context) => GroupSelectionProvider()..initialize(),
      child: const GroupSelectionScreen(),
    );
  }

  @override
  State<GroupSelectionScreen> createState() => _GroupSelectionScreenState();
}

class _GroupSelectionScreenState extends State<GroupSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Link to Groups',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA70024x24,
        onLeadingPressed: () => Navigator.pop(context),
        backgroundColor: appTheme.gray_900,
        titleColor: appTheme.white_A700,
      ),
      body: Consumer<GroupSelectionProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 16.h, left: 16.h),
                        child: Text(
                          'Select Groups',
                          style: TextStyleHelper.instance.title18BoldInter
                              .copyWith(
                                  color: appTheme.white_A700, height: 1.22),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.groups.length,
                        itemBuilder: (context, index) {
                          final group = provider.groups[index];
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 12.h,
                            ),
                            color: appTheme.gray_900,
                            child: Row(
                              children: [
                                CustomIconButton(
                                  iconPath: ImageConstant.imgDepth3Frame02,
                                  height: 48.h,
                                  width: 48.h,
                                  padding: 12.h,
                                  backgroundColor: appTheme.blue_gray_900,
                                  borderRadius: 8.h,
                                ),
                                SizedBox(width: 16.h),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        group.name ?? '',
                                        style: TextStyleHelper
                                            .instance.title16MediumInter
                                            .copyWith(height: 1.25),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        group.deviceCount ?? '',
                                        style: TextStyleHelper
                                            .instance.body14RegularInter
                                            .copyWith(height: 1.21),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      provider.toggleGroupSelection(index),
                                  child: CustomImageView(
                                    imagePath: (group.isSelected ?? false)
                                        ? ImageConstant.imgDepth3Frame1Selected
                                        : ImageConstant
                                            .imgDepth3Frame1BlueGray700,
                                    height: 28.h,
                                    width: 28.h,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 488.h),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Save',
                      onPressed: () => provider.saveSelection(context),
                      width: double.infinity,
                      backgroundColor: appTheme.blue_700,
                      textColor: appTheme.white_A700,
                      fontSize: 16.fSize,
                      fontWeight: FontWeight.w700,
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.h,
                        vertical: 12.h,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
