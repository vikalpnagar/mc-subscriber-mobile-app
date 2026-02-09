import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import './provider/router_detail_provider.dart';
import './widgets/action_item_widget.dart';
import './widgets/connected_device_item_widget.dart';
import './widgets/uptime_card_widget.dart';

class RouterDetailScreen extends StatefulWidget {
  const RouterDetailScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<RouterDetailProvider>(
      create: (context) => RouterDetailProvider(),
      child: const RouterDetailScreen(),
    );
  }

  @override
  State<RouterDetailScreen> createState() => _RouterDetailScreenState();
}

class _RouterDetailScreenState extends State<RouterDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RouterDetailProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: "Router Details",
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => Navigator.pop(context),
        backgroundColor: appTheme.gray_900,
      ),
      body: Consumer<RouterDetailProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                _buildRouterInfoSection(provider),
                SizedBox(height: 32.h),
                _buildDeviceInformationSection(provider),
                SizedBox(height: 220.h),
                _buildUptimeSection(provider),
                SizedBox(height: 38.h),
                _buildConnectedDevicesSection(provider),
                SizedBox(height: 16.h),
                _buildActionsSection(provider),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRouterInfoSection(RouterDetailProvider provider) {
    return Column(
      children: [
        Container(
          height: 128.h,
          width: 128.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64.h),
          ),
          child: CustomImageView(
            imagePath: provider.routerDetailModel.routerImage ?? '',
            height: 128.h,
            width: 128.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          provider.routerDetailModel.routerName ?? '',
          style:
              TextStyleHelper.instance.title22BoldInter.copyWith(height: 1.23),
        ),
        Text(
          provider.routerDetailModel.routerModel ?? '',
          style: TextStyleHelper.instance.title16RegularInter
              .copyWith(color: appTheme.indigo_200, height: 1.25),
        ),
        Text(
          provider.routerDetailModel.serialNumber ?? '',
          style: TextStyleHelper.instance.title16RegularInter
              .copyWith(color: appTheme.indigo_200, height: 1.25),
        ),
      ],
    );
  }

  Widget _buildDeviceInformationSection(RouterDetailProvider provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Device Information',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700, height: 1.22),
          ),
          SizedBox(height: 24.h),
          Column(
            spacing: 24.h,
            children: [
              Row(
                spacing: 24.h,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(top: 18.h, bottom: 20.h),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: appTheme.gray_200, width: 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Firmware Version',
                            style: TextStyleHelper.instance.body14RegularInter
                                .copyWith(height: 1.5),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            provider.routerDetailModel.firmwareVersion ?? '',
                            style: TextStyleHelper.instance.body14RegularInter
                                .copyWith(
                                    color: appTheme.white_A700, height: 1.21),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 18.h),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: appTheme.gray_200, width: 1),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IP Address',
                            style: TextStyleHelper.instance.body14RegularInter
                                .copyWith(height: 1.21),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            provider.routerDetailModel.ipAddress ?? '',
                            style: TextStyleHelper.instance.body14RegularInter
                                .copyWith(
                                    color: appTheme.white_A700, height: 1.21),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 64.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 126.h,
                        height: 64.h,
                        child: Stack(
                          children: [
                            Container(
                              width: 72.h,
                              height: 62.h,
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(
                                      color: appTheme.gray_200, width: 1),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 23.h,
                              left: 0,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'MAC Address',
                                    style: TextStyleHelper
                                        .instance.body14RegularInter
                                        .copyWith(height: 1.5),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    provider.routerDetailModel.macAddress ?? '',
                                    style: TextStyleHelper
                                        .instance.body14RegularInter
                                        .copyWith(
                                            color: appTheme.white_A700,
                                            height: 1.21),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: 258.h,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: appTheme.gray_200, width: 1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.h),
                            Text(
                              'Status',
                              style: TextStyleHelper.instance.body14RegularInter
                                  .copyWith(height: 1.21),
                            ),
                            Text(
                              provider.routerDetailModel.status ?? '',
                              style: TextStyleHelper.instance.body14RegularInter
                                  .copyWith(
                                      color: appTheme.white_A700, height: 1.21),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUptimeSection(RouterDetailProvider provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Uptime',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700, height: 1.22),
          ),
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.h),
            child: Row(
              spacing: 16.h,
              children: provider.uptimeItems
                  .map(
                    (item) => UptimeCardWidget(
                      uptimeItemModel: item,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConnectedDevicesSection(RouterDetailProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            'Connected Devices',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700, height: 1.22),
          ),
        ),
        SizedBox(height: 8.h),
        Column(
          children: provider.connectedDevices
              .map(
                (device) => ConnectedDeviceItemWidget(
                  connectedDeviceModel: device,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildActionsSection(RouterDetailProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            'Actions',
            style: TextStyleHelper.instance.title18BoldInter
                .copyWith(color: appTheme.white_A700, height: 1.22),
          ),
        ),
        SizedBox(height: 8.h),
        Column(
          children: provider.actionItems
              .map(
                (action) => ActionItemWidget(
                  actionItemModel: action,
                  onTap: () => provider.handleActionTap(action),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
