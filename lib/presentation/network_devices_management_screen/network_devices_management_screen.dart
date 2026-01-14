import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './provider/network_devices_management_provider.dart';
import './widgets/device_item_widget.dart';

class NetworkDevicesManagementScreen extends StatefulWidget {
  const NetworkDevicesManagementScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<NetworkDevicesManagementProvider>(
      create: (context) => NetworkDevicesManagementProvider(),
      child: const NetworkDevicesManagementScreen(),
    );
  }

  @override
  State<NetworkDevicesManagementScreen> createState() =>
      _NetworkDevicesManagementScreenState();
}

class _NetworkDevicesManagementScreenState
    extends State<NetworkDevicesManagementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NetworkDevicesManagementProvider>().initialize();
    });
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
      body: Column(
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
              indicatorColor: appTheme.transparentCustom,
              dividerColor: appTheme.transparentCustom,
              labelColor: appTheme.white_A700,
              unselectedLabelColor: appTheme.indigo_200,
              labelStyle: TextStyleHelper.instance.body14BoldInter
                  .copyWith(height: 1.21),
              unselectedLabelStyle: TextStyleHelper.instance.body14BoldInter
                  .copyWith(height: 1.21),
              tabs: [
                Tab(
                  child: GestureDetector(
                    onTap: () {
                      NavigatorService.pushNamed(
                          AppRoutes.deviceManagementScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text('Mobile devices'),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text('Router/mesh devices'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(), // Mobile devices tab content (empty for now)
                _buildRouterMeshDevicesTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouterMeshDevicesTab() {
    return Consumer<NetworkDevicesManagementProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.deviceList.length,
                  itemBuilder: (context, index) {
                    return DeviceItemWidget(
                      deviceItem: provider.deviceList[index],
                      onButtonTap: () {
                        provider.handleDeviceAction(provider.deviceList[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
