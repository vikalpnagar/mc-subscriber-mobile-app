import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import './provider/add_devices_provider.dart';
import './widgets/device_item_widget.dart';

class AddDevicesScreen extends StatefulWidget {
  const AddDevicesScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddDevicesProvider>(
      create: (context) => AddDevicesProvider()..initialize(),
      child: const AddDevicesScreen(),
    );
  }

  @override
  State<AddDevicesScreen> createState() => _AddDevicesScreenState();
}

class _AddDevicesScreenState extends State<AddDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Add Devices',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, left: 16.h),
                    child: Text(
                      'Available Devices',
                      style: TextStyleHelper.instance.title22BoldInter,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Consumer<AddDevicesProvider>(
                    builder: (context, provider, child) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.availableDevices.length,
                        itemBuilder: (context, index) {
                          final device = provider.availableDevices[index];
                          return DeviceItemWidget(
                            device: device,
                            onTap: () => provider.toggleDeviceSelection(device),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 404.h),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: CustomButton(
              text: 'Add Selected Devices',
              onPressed: () {
                Provider.of<AddDevicesProvider>(context, listen: false)
                    .addSelectedDevices();
              },
              margin: EdgeInsets.only(bottom: 12.h),
            ),
          ),
        ],
      ),
    );
  }
}
