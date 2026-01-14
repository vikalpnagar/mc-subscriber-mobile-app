import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import './provider/app_navigation_provider.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  AppNavigationScreenState createState() => AppNavigationScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNavigationProvider(),
      child: AppNavigationScreen(),
    );
  }
}

class AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Column(
                    children: [
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Three",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.onboardingScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Four",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.networkWelcomeScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Ten",
                        onTapScreenTitle: () =>
                            onTapScreenTitle(context, AppRoutes.loginScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Eighteen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.forgotPasswordScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Seventeen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.passwordResetConfirmationScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "sign up",
                        onTapScreenTitle: () =>
                            onTapScreenTitle(context, AppRoutes.signUpScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Twenty",
                        onTapScreenTitle: () => onTapScreenTitle(context,
                            AppRoutes.passwordResetConfirmationScreenTwo),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.networkDashboardScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Fifteen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.networkHealthScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Five",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.addDeviceSetupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Depth 0, Frame Zero Two",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.deviceConfigurationScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Twelve",
                        onTapScreenTitle: () => onTapScreenTitle(context,
                            AppRoutes.deviceConfigurationSuccessScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Depth 0, Frame Zero Three",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.familyWiFiManagementScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Depth 0, Frame Zero One",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.addFamilyWiFiGroupScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Six",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.associateSchedulesScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Eleven",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.groupDetailScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Depth 0, Frame Zero",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.addDevicesScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Thirteen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.newScheduleCreationScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design TwentyOne",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.groupSelectionScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Nineteen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.scheduleDetailScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Seven",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.speedTestProgressScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Sixteen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.speedTestHistoryScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design One",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.speedTestResultsScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Eight",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.deviceManagementScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Two",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.networkDevicesManagementScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Fourteen",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.routerDetailScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design Nine",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.editNetworkScreen),
                      ),
                      _buildScreenTitle(
                        context,
                        screenTitle: "Stitch Design TwentyTwo",
                        onTapScreenTitle: () => onTapScreenTitle(
                            context, AppRoutes.editGuestNetworkScreen),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        decoration: BoxDecoration(color: Color(0XFFFFFFFF)),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.instance.title20RegularRoboto
                      .copyWith(color: Color(0XFF000000)),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Color(0XFF343330),
                )
              ],
            ),
            SizedBox(height: 10.h),
            Divider(height: 1.h, thickness: 1.h, color: Color(0XFFD2D2D2)),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(BuildContext context, String routeName) {
    NavigatorService.pushNamed(routeName);
  }

  /// Common click event for bottomsheet
  void onTapBottomSheetTitle(BuildContext context, Widget className) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return className;
      },
      isScrollControlled: true,
      backgroundColor: appTheme.transparentCustom,
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(BuildContext context, Widget className) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: className,
          backgroundColor: appTheme.transparentCustom,
          insetPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
