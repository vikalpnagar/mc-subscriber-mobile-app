import 'package:family_wifi/presentation/device_management_screen/models/router_device_info_model.dart';
import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_icon_button.dart';

class RouterDeviceItemView extends StatelessWidget {
  final RouterDeviceInfoModel deviceItem;
  final VoidCallback? onButtonTap;

  const RouterDeviceItemView({
    Key? key,
    required this.deviceItem,
    this.onButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showActionButton = deviceItem.actionButtonText != null;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(color: appTheme.gray_900),
      child: Row(
        children: [
          CustomIconButton(
            iconPath: deviceItem.deviceIcon,
            height: 48.h,
            width: 48.h,
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
            padding: 12.h,
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    deviceItem.deviceName,
                    style: TextStyleHelper.instance.title16MediumInter.copyWith(
                      height: 1.25,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                FittedBox(
                  child: Text(
                    deviceItem.deviceUptime,
                    style: TextStyleHelper.instance.body14RegularInter.copyWith(
                      height: 1.21,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showActionButton) SizedBox(width: 16.h),
          if (showActionButton)
            CustomButton(
              text: deviceItem.actionButtonText!,
              onPressed: onButtonTap,
              backgroundColor: appTheme.blue_gray_900,
              textColor: appTheme.white_A700,
              fontSize: 14.fSize,
              fontWeight: FontWeight.w500,
              padding: EdgeInsets.symmetric(
                horizontal: (deviceItem.isMainRouter) ? 8.h : 20.h,
                vertical: 6.h,
              ),
            ),
        ],
      ),
    );
  }
}
