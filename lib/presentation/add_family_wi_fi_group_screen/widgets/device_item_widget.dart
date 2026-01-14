import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/device_item_model.dart';

class DeviceItemWidget extends StatelessWidget {
  final DeviceItemModel deviceItem;
  final VoidCallback? onTap;

  const DeviceItemWidget({
    Key? key,
    required this.deviceItem,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.gray_900,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
        child: Row(
          spacing: 16.h,
          children: [
            CustomIconButton(
              iconPath: deviceItem.iconPath ?? ImageConstant.imgDepth4Frame01,
              backgroundColor: (deviceItem.isSelected ?? false)
                  ? Color(0xFF1172D3)
                  : appTheme.blue_gray_900,
              height: 48.h,
              width: 48.h,
              padding: 12.h,
              borderRadius: 8.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deviceItem.deviceName ?? '',
                    style: TextStyleHelper.instance.title16MediumInter,
                  ),
                  Text(
                    deviceItem.deviceType ?? '',
                    style: TextStyleHelper.instance.body14RegularInter,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
