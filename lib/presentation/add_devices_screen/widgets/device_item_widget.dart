import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/add_devices_model.dart';

class DeviceItemWidget extends StatelessWidget {
  final AddDevicesModel device;
  final VoidCallback? onTap;

  const DeviceItemWidget({
    Key? key,
    required this.device,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: appTheme.gray_900,
        ),
        child: Row(
          spacing: 16.h,
          children: [
            CustomIconButton(
              iconPath: device.icon,
              height: 48.h,
              width: 48.h,
              padding: 12.h,
              backgroundColor: appTheme.blue_gray_900,
              borderRadius: 8.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2.h,
                children: [
                  Text(
                    device.name ?? '',
                    style: TextStyleHelper.instance.title16MediumInter,
                  ),
                  Text(
                    device.model ?? '',
                    style: TextStyleHelper.instance.body14RegularInter,
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgDepth3Frame1BlueGray700,
              height: 28.h,
              width: 28.h,
            ),
          ],
        ),
      ),
    );
  }
}
