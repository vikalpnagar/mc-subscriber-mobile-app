import 'package:el_tooltip/el_tooltip.dart';
import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:family_wifi/presentation/home_screen/models/subscriber_info.dart';
import 'package:family_wifi/presentation/home_screen/models/topology_info.dart'
    hide Node;
import 'package:family_wifi/presentation/home_screen/provider/home_provider.dart';
import 'package:family_wifi/presentation/network_health_screen/network_health_screen_initial_page.dart';
import 'package:family_wifi/presentation/network_health_screen/provider/network_health_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './provider/network_dashboard_provider.dart';
import './widgets/network_item_widget.dart';

class NetworkDashboardScreen extends StatefulWidget {
  const NetworkDashboardScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    final homeController = Provider.of<HomeProvider>(context, listen: false);
    return ValueListenableProvider<TopologyInfo?>.value(
      value: homeController.topologyInfo,
      child: ProxyProvider<TopologyInfo?, NetworkDashboardProvider>(
        update:
            (
              BuildContext context,
              TopologyInfo? topologyInfo,
              NetworkDashboardProvider? previous,
            ) {
              final netProvider = previous ?? NetworkDashboardProvider();
              netProvider.handleTopologyInfo(topologyInfo);
              return netProvider;
            },
        child: const NetworkDashboardScreen(),
      ),
    );
  }

  @override
  State<NetworkDashboardScreen> createState() => _NetworkDashboardScreenState();
}

class _NetworkDashboardScreenState extends State<NetworkDashboardScreen>
    with TickerProviderStateMixin {
  late final NetworkDashboardProvider dashboardController;
  late final HomeProvider homeController;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    context.read<NetworkDashboardProvider>().initialize();
    dashboardController = Provider.of<NetworkDashboardProvider>(
      context,
      listen: false,
    );
    dashboardController.initialize();
    homeController = Provider.of<HomeProvider>(context, listen: false);
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
    return RefreshIndicator(
      // Customize which scroll notifications the RefreshIndicator listens to.
      notificationPredicate: (notification) {
        // return notification.depth == 2; // Common solution for TabBarView
        // A more general solution to allow the outer scroll view to trigger the refresh
        return notification.depth == 2;
      },
      key: homeController.refreshIndicatorKey,
      onRefresh: () =>
          homeController.handlePullToRefresh(showPopupLoader: false),
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [SliverToBoxAdapter(child: _buildTabSection())];
        },
        body: _buildTabContent(),
      ),
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
          tabController.animateTo(index);
        },
      ),
    );
  }

  Widget _buildTabContent() {
    return ValueListenableProvider.value(
      value: homeController.subscriberInfo,
      child: TabBarView(
        controller: tabController,
        children: [
          _buildOverviewTab(),
          ChangeNotifierProvider(
            create: (context) => NetworkHealthProvider(),
            child: NetworkHealthScreenInitialPage(),
          ),
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
            SizedBox(height: 12.h),
            Align(
              alignment: Alignment.centerRight,
              child: _buildAddMeshDeviceButton(),
            ),
            _buildNetworkSections(),
          ],
        ),
      ),
    );
  }

  Widget _buildNetworkTopologySection() {
    return ValueListenableProvider<bool>.value(
      value: dashboardController.displayGraph,
      child: Consumer<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          return Container(
            width: double.infinity,
            height: 250,
            margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(12.0),
            color: appTheme.blue_gray_900,
            child: value
                ? GraphView.builder(
                    graph: dashboardController.graph,
                    algorithm: CircleLayoutAlgorithm(
                      CircleLayoutConfiguration(
                        radius: 200.0,
                        reduceEdgeCrossing: true,
                      ),
                      null,
                    ),
                    autoZoomToFit: true, // Automatically zoom to fit all nodes
                    // initialNode: ValueKey('startNode'), // Jump to specific node on init
                    // panAnimationDuration: Duration(milliseconds: 600),
                    // toggleAnimationDuration: Duration(milliseconds: 400),
                    centerGraph: true, // Center the graph in viewport
                    builder: (Node node) {
                      return buildNode(node);
                    },
                  )
                : SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget buildNode(Node node) {
    GraphNodeInfo nodeInfo = node.key!.value as GraphNodeInfo;
    return ElTooltip(
      showChildAboveOverlay: false,
      distance: 2.0,
      radius: Radius.circular(4),
      padding: EdgeInsetsGeometry.all(8),
      content: Text(
        nodeInfo.label,
        style: TextStyleHelper.instance.body12MediumInter,
      ),
      child: Container(
        // width: 52.0,
        // height: 52.0,
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: nodeInfo.color!),
        ),
        child: nodeInfo.icon != null
            ? Icon(nodeInfo.icon, color: nodeInfo.color, size: 24.0)
            : Text(
                nodeInfo.label,
                style: TextStyleHelper.instance.title18BoldInter.copyWith(
                  color: nodeInfo.color,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }

  Widget _buildAddMeshDeviceButton() {
    return CustomButton(
      text: 'Add another mesh device',
      onPressed: () {
        NavigatorService.pushNamed(AppRoutes.addDeviceSetupScreen);
      },
      backgroundColor: appTheme.blue_gray_900,
      textColor: appTheme.white_A700,
      fontSize: 14.fSize,
      fontWeight: FontWeight.w700,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
    );
  }

  Widget _buildNetworkSections() {
    return Consumer<SubscriberInfo?>(
      builder:
          (
            BuildContext context,
            SubscriberInfo? subscriberInfo,
            Widget? child,
          ) {
            return Column(
              children: [
                _buildPrivateNetworkSection(
                  subscriberInfo?.privateWiFiMacAddress,
                  subscriberInfo?.privateWiFiSSID,
                ),
                _buildGuestNetworkSection(),
                child!,
              ],
            );
          },
      child: Column(
        children: dashboardController.networkItems
            .map((item) => NetworkItemWidget(networkItem: item))
            .toList(),
      ),
    );
  }

  Widget _buildPrivateNetworkSection(String? macAddress, String? networkName) {
    return GestureDetector(
      onTap: () async {
        await NavigatorService.pushNamed(
          AppRoutes.editNetworkScreen,
          arguments: {'macAddress': macAddress, 'networkName': networkName},
        );
        homeController.triggerPullToRefresh();
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
                    networkName ?? 'Home Wi-Fi Network Name (SSID)',
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
    return GestureDetector(
      onTap: () {
        NavigatorService.pushNamed(AppRoutes.editGuestNetworkScreen);
      },
      child: Container(
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
      ),
    );
  }
}
