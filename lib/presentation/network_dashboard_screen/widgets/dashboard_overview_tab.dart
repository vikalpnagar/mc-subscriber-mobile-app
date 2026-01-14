import 'package:family_wifi/core/app_export.dart';
import 'package:family_wifi/presentation/home_screen/models/subscriber_info.dart';
import 'package:family_wifi/presentation/home_screen/provider/home_provider.dart';
import 'package:family_wifi/presentation/network_dashboard_screen/models/network_item_model.dart';
import 'package:family_wifi/presentation/network_dashboard_screen/provider/network_dashboard_provider.dart';
import 'package:family_wifi/presentation/network_dashboard_screen/widgets/network_item_widget.dart';
import 'package:family_wifi/widgets/custom_button.dart';
import 'package:family_wifi/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class DashboardOverviewTab extends StatefulWidget {
  const DashboardOverviewTab({super.key});

  @override
  State<DashboardOverviewTab> createState() => _DashboardOverviewTabState();
}

class _DashboardOverviewTabState extends State<DashboardOverviewTab>
    with AutomaticKeepAliveClientMixin {
  late final NetworkDashboardProvider dashboardController;

  @override
  void initState() {
    super.initState();
    dashboardController = Provider.of<NetworkDashboardProvider>(
      context,
      listen: false,
    );
    dashboardController.initialize();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildOverviewTab();
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      key: const PageStorageKey<String>('OverviewTab'),
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
                    controller: dashboardController.graphController,
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
    return Container(
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
                _buildMobileDeviceInfoSection(),
                child!,
              ],
            );
          },
      child: Column(
        children: dashboardController.networkItems
            .map(
              (item) => GestureDetector(
                onTap: item.onTap,
                child: NetworkItemWidget(networkItem: item),
              ),
            )
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
        context.read<HomeProvider>().fetchLatestData(showPopupLoader: false);
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

  Widget _buildMobileDeviceInfoSection() {
    return ValueListenableProvider<NetworkItemModel>.value(
      value: dashboardController.mobileDeviceInfo,
      child: Consumer<NetworkItemModel>(
        builder: (BuildContext context, NetworkItemModel value, Widget? child) {
          return GestureDetector(
            onTap: () => context.read<HomeProvider>().onNavBarItemSelected(1),
            child: NetworkItemWidget(networkItem: value),
          );
        },
      ),
    );
  }
}
