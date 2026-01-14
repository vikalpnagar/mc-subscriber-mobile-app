import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/connected_device_model.dart';

class ConnectedDeviceItemWidget extends StatelessWidget {
  final ConnectedDeviceModel connectedDeviceModel;

  const ConnectedDeviceItemWidget({
    Key? key,
    required this.connectedDeviceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      color: appTheme.gray_900,
      child: Row(
        spacing: 16.h,
        children: [
          CustomIconButton(
            iconPath: connectedDeviceModel.icon ?? '',
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
                  connectedDeviceModel.deviceName ?? '',
                  style: TextStyleHelper.instance.title16MediumInter
                      .copyWith(height: 1.25),
                ),
                Text(
                  connectedDeviceModel.deviceType ?? '',
                  style: TextStyleHelper.instance.body14RegularInter
                      .copyWith(height: 1.21),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
