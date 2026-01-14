import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/device_item_model.dart';
import '../provider/group_detail_provider.dart';

class DeviceItemWidget extends StatelessWidget {
  final DeviceItemModel device;

  const DeviceItemWidget({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 12.h,
      ),
      color: appTheme.gray_900,
      child: Row(
        spacing: 16.h,
        children: [
          CustomIconButton(
            iconPath: device.icon ?? '',
            height: 48.h,
            width: 48.h,
            padding: 12.h,
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
          ),
          Expanded(
            child: Column(
              spacing: 2.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.title ?? '',
                  style: TextStyleHelper.instance.title16MediumInter
                      .copyWith(height: 1.25),
                ),
                Text(
                  device.subtitle ?? '',
                  style: TextStyleHelper.instance.body14RegularInter
                      .copyWith(height: 1.21),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<GroupDetailProvider>(context, listen: false)
                  .removeDevice(device);
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgDepth4Frame0WhiteA70024x24,
              height: 28.h,
              width: 28.h,
            ),
          ),
        ],
      ),
    );
  }
}
