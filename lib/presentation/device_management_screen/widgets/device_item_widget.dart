import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/device_management_model.dart';

class DeviceItemWidget extends StatelessWidget {
  final DeviceManagementModel device;
  final VoidCallback? onIconTap;
  final VoidCallback? onPauseTap;

  const DeviceItemWidget({
    Key? key,
    required this.device,
    this.onIconTap,
    this.onPauseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: appTheme.gray_900,
      ),
      child: Row(
        spacing: 16.h,
        children: [
          CustomIconButton(
            iconPath: device.iconPath,
            onTap: onIconTap,
            height: 48.h,
            width: 48.h,
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
          ),
          Expanded(
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.deviceName ?? '',
                  style: TextStyleHelper.instance.title16MediumInter,
                ),
                Text(
                  '${device.uploadSpeed ?? ''} ${device.downloadSpeed ?? ''}',
                  style: TextStyleHelper.instance.body14RegularInter,
                ),
              ],
            ),
          ),
          CustomButton(
            text: (device.isPaused ?? false) ? 'Resume' : 'Pause',
            onPressed: onPauseTap,
            backgroundColor: appTheme.blue_gray_900,
            fontSize: 14.fSize,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 6.h),
          ),
        ],
      ),
    );
  }
}
