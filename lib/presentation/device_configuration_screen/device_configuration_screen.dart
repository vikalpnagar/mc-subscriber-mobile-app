import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './provider/device_configuration_provider.dart';

class DeviceConfigurationScreen extends StatefulWidget {
  const DeviceConfigurationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DeviceConfigurationProvider>(
      create: (context) => DeviceConfigurationProvider(),
      child: const DeviceConfigurationScreen(),
    );
  }

  @override
  State<DeviceConfigurationScreen> createState() =>
      _DeviceConfigurationScreenState();
}

class _DeviceConfigurationScreenState extends State<DeviceConfigurationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DeviceConfigurationProvider>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Add a device',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA70024x24,
        onLeadingPressed: () => NavigatorService.goBack(),
        backgroundColor: appTheme.gray_900,
        titleColor: appTheme.white_A700,
      ),
      body: Consumer<DeviceConfigurationProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20.h),
                      alignment: Alignment.center,
                      child: Text(
                        'Configuring the device...',
                        style: TextStyleHelper.instance.headline24BoldInter
                            .copyWith(height: 1.25),
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      height: 4.h,
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      decoration: BoxDecoration(
                        color: appTheme.blue_gray_700,
                        borderRadius: BorderRadius.circular(4.h),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: (390.h - 32.h) * provider.progressValue,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: appTheme.blue_700,
                            borderRadius: BorderRadius.circular(4.h),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
                      height: 20.h,
                      color: appTheme.gray_900,
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
