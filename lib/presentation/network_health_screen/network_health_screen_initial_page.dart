import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_image_view.dart';
import './provider/network_health_provider.dart';
import './widgets/health_status_item_widget.dart';

// Modified: Corrected import path

class NetworkHealthScreenInitialPage extends StatelessWidget {
  const NetworkHealthScreenInitialPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return NetworkHealthScreenInitialPage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: appTheme.gray_900),
      child: Column(
        children: [
          // _buildHeader(context),
          // _buildTabSection(context),
          _buildHealthContent(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 8.h),
      color: appTheme.gray_900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              'Home',
              textAlign: TextAlign.center,
              style: TextStyleHelper.instance.title18BoldInter.copyWith(
                color: appTheme.white_A700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgDepth3Frame1,
              height: 48.h,
              width: 48.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection(BuildContext context) {
    return Consumer<NetworkHealthProvider>(
      builder: (context, provider, child) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: appTheme.blue_gray_700, width: 1.h),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  provider
                      .selectOverviewTab(); // Modified: Removed null safety issue
                  NavigatorService.pushNamed(AppRoutes.networkDashboardScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    'Overview',
                    style: TextStyleHelper.instance.body14BoldInter.copyWith(
                      color: appTheme.indigo_200,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 32.h),
              GestureDetector(
                onTap: () {
                  provider
                      .selectHealthTab(); // Modified: Removed null safety issue
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    'Health',
                    style: TextStyleHelper.instance.body14BoldInter.copyWith(
                      color: appTheme.white_A700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHealthContent(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.h),
              child: Text(
                'Network Health',
                style: TextStyleHelper.instance.title22BoldInter,
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Consumer<NetworkHealthProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider
                        .healthStatusList
                        .length, // Modified: Removed null check and cast
                    itemBuilder: (context, index) {
                      return HealthStatusItemWidget(
                        healthStatusItemModel: provider.healthStatusList[index],
                      ); // Modified: Removed null check and cast
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
