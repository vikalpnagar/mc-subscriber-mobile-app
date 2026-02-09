import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
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
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          color: appTheme.gray_900,
        ),
        child: Row(
          children: [
            CustomIconButton(
              iconPath:
                  scheduleItem.iconPath ?? ImageConstant.imgDepth4Frame048x48,
              height: 48.h,
              width: 48.h,
              padding: 12.h,
              backgroundColor: appTheme.blue_gray_900,
              borderRadius: 8.h,
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    scheduleItem.title ?? '',
                    style: TextStyleHelper.instance.title16MediumInter
                        .copyWith(height: 1.25),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    scheduleItem.subtitle ?? '',
                    style: TextStyleHelper.instance.body14RegularInter
                        .copyWith(height: 1.21),
                  ),
                ],
              ),
            ),
            Container(
              height: 28.h,
              width: 28.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: (scheduleItem.isSelected ?? false)
                      ? Color(0xFF1172D3)
                      : appTheme.colorFF607D,
                  width: 2.h,
                ),
                borderRadius: BorderRadius.circular(4.h),
                color: (scheduleItem.isSelected ?? false)
                    ? Color(0xFF1172D3)
                    : appTheme.transparentCustom,
              ),
              child: (scheduleItem.isSelected ?? false)
                  ? Icon(
                      Icons.check,
                      color: appTheme.whiteCustom,
                      size: 16.h,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
