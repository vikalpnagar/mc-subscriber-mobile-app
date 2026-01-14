import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/health_status_item_model.dart';

class HealthStatusItemWidget extends StatelessWidget {
  final HealthStatusItemModel healthStatusItemModel;

  const HealthStatusItemWidget({
    Key? key,
    required this.healthStatusItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      color: appTheme.gray_900,
      child: Row(
        children: [
          CustomIconButton(
            iconPath: healthStatusItemModel.icon,
            height: 48.h,
            width: 48.h,
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  healthStatusItemModel.title ?? '',
                  style: TextStyleHelper.instance.title16MediumInter,
                ),
                SizedBox(height: 2.h),
                Text(
                  healthStatusItemModel.status ?? '',
                  style: TextStyleHelper.instance.body14RegularInter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
