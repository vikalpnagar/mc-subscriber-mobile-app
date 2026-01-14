import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/network_item_model.dart';

class NetworkItemWidget extends StatelessWidget {
  final NetworkItemModel networkItem;

  const NetworkItemWidget({
    Key? key,
    required this.networkItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: networkItem.onTap,
      child: Container(
        padding: EdgeInsets.all(16.h),
        color: appTheme.gray_900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                spacing: networkItem.title == 'Family WiFi' ? 4.h : 2.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    networkItem.title ?? '',
                    style: TextStyleHelper.instance.title16MediumInter,
                  ),
                  Text(
                    networkItem.subtitle ?? '',
                    style: TextStyleHelper.instance.body14RegularInter,
                  ),
                ],
              ),
            ),
            Container(
              margin: networkItem.title == 'Family WiFi' ||
                      networkItem.title == 'Speed Test'
                  ? EdgeInsets.only(bottom: 8.h)
                  : EdgeInsets.zero,
              child: Text(
                networkItem.value ?? '',
                style: TextStyleHelper.instance.title16RegularInter
                    .copyWith(color: appTheme.white_A700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
