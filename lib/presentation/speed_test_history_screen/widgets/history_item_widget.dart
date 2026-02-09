import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/speed_test_history_model.dart';

class HistoryItemWidget extends StatelessWidget {
  final SpeedTestHistoryModel historyItem;
  final VoidCallback? onTap;

  const HistoryItemWidget({
    Key? key,
    required this.historyItem,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
        decoration: BoxDecoration(
          color: appTheme.gray_900,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    historyItem.date ?? '',
                    style: TextStyleHelper.instance.title16MediumInter
                        .copyWith(height: 1.25),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '${historyItem.downloadSpeed ?? ''} | ${historyItem.uploadSpeed ?? ''}',
                    style: TextStyleHelper.instance.body14RegularInter
                        .copyWith(height: 1.21),
                  ),
                ],
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowRight,
              height: 28.h,
              width: 28.h,
            ),
          ],
        ),
      ),
    );
  }
}
