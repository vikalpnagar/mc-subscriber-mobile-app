import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_icon_button.dart';
import '../models/action_item_model.dart';

class ActionItemWidget extends StatelessWidget {
  final ActionItemModel actionItemModel;
  final VoidCallback? onTap;

  const ActionItemWidget({
    Key? key,
    required this.actionItemModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.h),
        color: appTheme.gray_900,
        child: Row(
          children: [
            CustomIconButton(
              iconPath: actionItemModel.icon ?? '',
              height: 40.h,
              width: 40.h,
              padding: 8.h,
              backgroundColor: appTheme.blue_gray_900,
              borderRadius: 8.h,
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: Text(
                actionItemModel.title ?? '',
                style: TextStyleHelper.instance.title16RegularInter
                    .copyWith(color: appTheme.white_A700, height: 1.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
