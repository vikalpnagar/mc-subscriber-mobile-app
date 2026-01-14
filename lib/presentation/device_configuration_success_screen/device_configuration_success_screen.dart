import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './provider/device_configuration_success_provider.dart';

class DeviceConfigurationSuccessScreen extends StatefulWidget {
  const DeviceConfigurationSuccessScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DeviceConfigurationSuccessProvider>(
      create: (context) => DeviceConfigurationSuccessProvider(),
      child: const DeviceConfigurationSuccessScreen(),
    );
  }

  @override
  State<DeviceConfigurationSuccessScreen> createState() =>
      _DeviceConfigurationSuccessScreenState();
}

class _DeviceConfigurationSuccessScreenState
    extends State<DeviceConfigurationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: _buildAppBar(context),
      body: Consumer<DeviceConfigurationSuccessProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 18.h),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.64,
                        child: Text(
                          'Device configured successfully!',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.instance.headline28BoldInter
                              .copyWith(height: 1.25),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 22.h,
                          left: 16.h,
                          right: 16.h,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgDepth4Frame06,
                          width: double.infinity,
                          height: 536.h,
                          fit: BoxFit.cover,
                          radius: BorderRadius.circular(8.h),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          top: 20.h,
                          left: 30.h,
                          right: 30.h,
                        ),
                        child: Text(
                          'Remove the mesh point from its current location and place it in the desired location.',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.instance.title16RegularInter
                              .copyWith(
                                  color: appTheme.white_A700, height: 1.5),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 82.h),
                        width: double.infinity,
                        height: 20.h,
                        color: appTheme.gray_900,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: Column(
                  children: [
                    CustomButton(
                      text: 'Done',
                      onPressed: () {
                        provider.onDonePressed(context);
                      },
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 12.h),
                      backgroundColor: appTheme.blue_700,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: 'Add a mesh point',
      hasLeading: true,
      leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
      onLeadingPressed: () => Navigator.pop(context),
      backgroundColor: appTheme.gray_900,
      titleColor: appTheme.white_A700,
    );
  }
}
