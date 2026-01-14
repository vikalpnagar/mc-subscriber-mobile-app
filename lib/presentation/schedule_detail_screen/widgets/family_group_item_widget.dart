import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/family_group_model.dart';

class FamilyGroupItemWidget extends StatelessWidget {
  final FamilyGroupModel familyGroup;

  const FamilyGroupItemWidget({
    Key? key,
    required this.familyGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.h),
      color: appTheme.gray_900,
      child: Row(
        children: [
          CustomIconButton(
            iconPath: familyGroup.icon ?? '',
            backgroundColor: appTheme.blue_gray_900,
            borderRadius: 8.h,
            height: 48.h,
            width: 48.h,
            padding: 12.h,
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  familyGroup.title ?? '',
                  style: TextStyleHelper.instance.title16MediumInter,
                ),
                SizedBox(height: 4.h),
                Text(
                  familyGroup.subtitle ?? '',
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
