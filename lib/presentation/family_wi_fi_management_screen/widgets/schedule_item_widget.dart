import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/schedule_item_model.dart';

class ScheduleItemWidget extends StatelessWidget {
  final ScheduleItemModel scheduleItem;
  final VoidCallback? onTap;

  const ScheduleItemWidget({
    Key? key,
    required this.scheduleItem,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
        decoration: BoxDecoration(
          color: appTheme.gray_900,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 2.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scheduleItem.title ?? '',
                    style: TextStyleHelper.instance.title16MediumInter
                        .copyWith(height: 1.25),
                  ),
                  Text(
                    scheduleItem.subtitle ?? '',
                    style: TextStyleHelper.instance.body14RegularInter
                        .copyWith(height: 1.21),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgDepth3Frame1WhiteA700,
              height: 28.h,
              width: 28.h,
            ),
          ],
        ),
      ),
    );
  }
}
