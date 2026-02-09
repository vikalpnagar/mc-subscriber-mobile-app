import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/uptime_item_model.dart';

class UptimeCardWidget extends StatelessWidget {
  final UptimeItemModel uptimeItemModel;

  const UptimeCardWidget({
    Key? key,
    required this.uptimeItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 18.h,
      children: [
        Container(
          width: 78.h,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: appTheme.blue_gray_900,
            borderRadius: BorderRadius.circular(8.h),
          ),
          child: Center(
            child: Text(
              uptimeItemModel.value ?? '',
              style: TextStyleHelper.instance.title18BoldInter
                  .copyWith(color: appTheme.white_A700, height: 1.22),
            ),
          ),
        ),
        Text(
          uptimeItemModel.label ?? '',
          style: TextStyleHelper.instance.body14RegularInter
              .copyWith(color: appTheme.white_A700, height: 1.21),
        ),
      ],
    );
  }
}
