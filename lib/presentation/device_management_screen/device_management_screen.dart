import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './provider/device_management_provider.dart';
import './widgets/device_item_widget.dart';

class DeviceManagementScreen extends StatefulWidget {
  const DeviceManagementScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DeviceManagementProvider>(
      create: (context) => DeviceManagementProvider()..initialize(),
      child: const DeviceManagementScreen(),
    );
  }

  @override
  State<DeviceManagementScreen> createState() => _DeviceManagementScreenState();
}

class _DeviceManagementScreenState extends State<DeviceManagementScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Devices',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<DeviceManagementProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: appTheme.blue_gray_700,
                      width: 1.h,
                    ),
                  ),
                ),
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Mobile devices',
                        style: TextStyleHelper.instance.body14BoldInter,
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Router/mesh devices',
                        style: TextStyleHelper.instance.body14BoldInter,
                      ),
                    ),
                  ],
                  labelColor: appTheme.white_A700,
                  unselectedLabelColor: appTheme.indigo_200,
                  indicator: BoxDecoration(),
                  dividerColor: appTheme.transparentCustom,
                  onTap: (index) {
                    if (index == 1) {
                      NavigatorService.pushNamed(
                          AppRoutes.networkDevicesManagementScreen);
                    }
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMobileDevicesTab(provider),
                    Container(), // Empty container for second tab
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMobileDevicesTab(DeviceManagementProvider provider) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: ListView.builder(
        itemCount: provider.mobileDevices.length,
        itemBuilder: (context, index) {
          return DeviceItemWidget(
            device: provider.mobileDevices[index],
            onIconTap: () {
              NavigatorService.pushNamed(
                  AppRoutes.networkDevicesManagementScreen);
            },
            onPauseTap: () {
              provider.toggleDevicePause(provider.mobileDevices[index]);
            },
          );
        },
      ),
    );
  }
}
