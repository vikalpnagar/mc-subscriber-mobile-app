import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../device_management_screen/device_management_screen.dart';
import '../family_wi_fi_management_screen/family_wi_fi_management_screen.dart';
import '../network_dashboard_screen/network_dashboard_screen.dart';
import './network_health_screen_initial_page.dart';
import './provider/network_health_provider.dart';

class NetworkHealthScreen extends StatefulWidget {
  const NetworkHealthScreen({Key? key}) : super(key: key);

  @override
  NetworkHealthScreenState createState() => NetworkHealthScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NetworkHealthProvider(),
      child: NetworkHealthScreen(),
    );
  }
}

class NetworkHealthScreenState extends State<NetworkHealthScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Navigator(
          key: navigatorKey,
          initialRoute: AppRoutes.networkHealthScreenInitialPage,
          onGenerateRoute: (routeSetting) => PageRouteBuilder(
            pageBuilder: (ctx, a1, a2) =>
                getCurrentPage(context, routeSetting.name!),
            transitionDuration: Duration(seconds: 0),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomBar(context),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Consumer<NetworkHealthProvider>(
      builder: (context, provider, child) {
        return CustomBottomBar(
          bottomBarItemList: provider.bottomBarItemList,
          selectedIndex: provider.selectedIndex,
          onChanged: (index) {
            provider.updateSelectedIndex(index);
            var bottomBarItem = provider.bottomBarItemList[index];
            navigatorKey.currentState?.pushNamed(bottomBarItem.routeName);
          },
        );
      },
    );
  }

  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.networkHealthScreenInitialPage:
        return NetworkHealthScreenInitialPage.builder(context);
      case AppRoutes.networkDashboardScreen:
        return NetworkDashboardScreen.builder(context);
      case AppRoutes.familyWiFiManagementScreen:
        return FamilyWiFiManagementScreen.builder(context);
      case AppRoutes.deviceManagementScreen:
        return DeviceManagementScreen.builder(context);
      default:
        return Container();
    }
  }
}
