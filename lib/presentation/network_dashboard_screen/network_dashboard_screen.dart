import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './provider/network_dashboard_provider.dart';
import './widgets/network_item_widget.dart';

class NetworkDashboardScreen extends StatefulWidget {
  const NetworkDashboardScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<NetworkDashboardProvider>(
      create: (context) => NetworkDashboardProvider(),
      child: const NetworkDashboardScreen(),
    );
  }

  @override
  State<NetworkDashboardScreen> createState() => _NetworkDashboardScreenState();
}

class _NetworkDashboardScreenState extends State<NetworkDashboardScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    context.read<NetworkDashboardProvider>().initialize();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  Widget buildSettingAppBarAction() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: CustomImageView(
        imagePath: ImageConstant.imgDepth3Frame1,
        height: 48.h,
        width: 48.h,
      ),
    );
  }

  Widget _buildMainContent() {
    return Expanded(
      child: Column(children: [_buildTabSection(), _buildTabContent()]),
    );
  }

  Widget _buildTabSection() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: appTheme.blue_gray_700, width: 1.h),
        ),
      ),
      child: TabBar(
        controller: tabController,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: appTheme.white_A700, width: 2.h),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: appTheme.white_A700,
        unselectedLabelColor: appTheme.indigo_200,
        labelStyle: TextStyleHelper.instance.body14BoldInter,
        unselectedLabelStyle: TextStyleHelper.instance.body14BoldInter,
        tabs: [
          Tab(text: 'Overview'),
          Tab(text: 'Health'),
        ],
        onTap: (index) {
          if (index == 1) {
            NavigatorService.pushNamed(AppRoutes.networkHealthScreen);
          }
        },
      ),
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          _buildOverviewTab(),
          Container(), // Health tab content handled by navigation
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.h),
              child: Text(
                'Network Topology',
                style: TextStyleHelper.instance.title22BoldInter,
              ),
            ),
            _buildNetworkTopologySection(),
            _buildNetworkSections(),
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkTopologySection() {
    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.all(16.h),
      color: appTheme.gray_900,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgDepth4Frame0,
              width: double.infinity,
              height: 238.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerRight,
            child: CustomButton(
              text: 'Add another mesh device',
              onPressed: () {
                NavigatorService.pushNamed(AppRoutes.addDeviceSetupScreen);
              },
              backgroundColor: appTheme.blue_gray_900,
              textColor: appTheme.white_A700,
              fontSize: 14.fSize,
              fontWeight: FontWeight.w700,
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkSections() {
    return Consumer<NetworkDashboardProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            _buildPrivateNetworkSection(),
            _buildGuestNetworkSection(),
            ...provider.networkItems
                .map((item) => NetworkItemWidget(networkItem: item))
                .toList(),
          ],
        );
      },
    );
  }

  Widget _buildPrivateNetworkSection() {
    return GestureDetector(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.editNetworkScreen);
      },
      child: Container(
        margin: EdgeInsets.only(top: 12.h),
        padding: EdgeInsets.all(16.h),
        color: appTheme.gray_900,
        child: Row(
          children: [
            Expanded(
              child: Column(
                spacing: 2.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Private Wi-Fi Network',
                    style: TextStyleHelper.instance.title16MediumInter,
                  ),
                  Text(
                    'Home Wi-Fi Network Name (SSID)',
                    style: TextStyleHelper.instance.body14RegularInter,
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

  Widget _buildGuestNetworkSection() {
    return Container(
      padding: EdgeInsets.all(16.h),
      color: appTheme.gray_900,
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 2.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Guest Wi-Fi Network',
                  style: TextStyleHelper.instance.title16MediumInter,
                ),
                Text(
                  'Guest Wi-Fi Network Name (SSID)',
                  style: TextStyleHelper.instance.body14RegularInter,
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
    );
  }

  Widget _buildBottomBar() {
    return Consumer<NetworkDashboardProvider>(
      builder: (context, provider, child) {
        return CustomBottomBar(
          bottomBarItemList: provider.bottomBarItems,
          selectedIndex: 0,
          onChanged: (index) {
            provider.updateSelectedIndex(index);
            switch (index) {
              case 0:
                // Already on Dashboard
                break;
              case 1:
                NavigatorService.pushNamed(AppRoutes.deviceManagementScreen);
                break;
              case 2:
                NavigatorService.pushNamed(AppRoutes.routerDetailScreen);
                break;
            }
          },
        );
      },
    );
  }
}
