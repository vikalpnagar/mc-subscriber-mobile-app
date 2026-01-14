import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/group_item_model.dart';

class GroupItemWidget extends StatelessWidget {
  final GroupItemModel groupItem;
  final VoidCallback? onTap;

  const GroupItemWidget({
    Key? key,
    required this.groupItem,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: groupItem.imagePath,
              height: 160.h,
              width: 160.h,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(8.h),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: Text(
                groupItem.title ?? '',
                style: TextStyleHelper.instance.title16MediumInter
                    .copyWith(height: 1.25),
              ),
            ),
            Text(
              groupItem.deviceCount ?? '',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(height: 1.21),
            ),
          ],
        ),
      ),
    );
  }
}
