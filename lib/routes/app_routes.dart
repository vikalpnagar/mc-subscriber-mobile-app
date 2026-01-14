import 'package:family_wifi/presentation/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import '../presentation/onboarding_screen/onboarding_screen.dart';
import '../presentation/network_welcome_screen/network_welcome_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/forgot_password_screen/forgot_password_screen.dart';
import '../presentation/password_reset_confirmation_screen/password_reset_confirmation_screen.dart';
import '../presentation/sign_up_screen/sign_up_screen.dart';
import '../presentation/password_reset_confirmation_screen_two_screen/password_reset_confirmation_screen_two_screen.dart';
import '../presentation/network_dashboard_screen/network_dashboard_screen.dart';
import '../presentation/network_health_screen/network_health_screen.dart';
import '../presentation/add_device_setup_screen/add_device_setup_screen.dart';
import '../presentation/device_configuration_screen/device_configuration_screen.dart';
import '../presentation/device_configuration_success_screen/device_configuration_success_screen.dart';
import '../presentation/family_wi_fi_management_screen/family_wi_fi_management_screen.dart';
import '../presentation/add_family_wi_fi_group_screen/add_family_wi_fi_group_screen.dart';
import '../presentation/associate_schedules_screen/associate_schedules_screen.dart';
import '../presentation/group_detail_screen/group_detail_screen.dart';
import '../presentation/add_devices_screen/add_devices_screen.dart';
import '../presentation/new_schedule_creation_screen/new_schedule_creation_screen.dart';
import '../presentation/group_selection_screen/group_selection_screen.dart';
import '../presentation/schedule_detail_screen/schedule_detail_screen.dart';
import '../presentation/speed_test_progress_screen/speed_test_progress_screen.dart';
import '../presentation/speed_test_history_screen/speed_test_history_screen.dart';
import '../presentation/speed_test_results_screen/speed_test_results_screen.dart';
import '../presentation/device_management_screen/device_management_screen.dart';
import '../presentation/network_devices_management_screen/network_devices_management_screen.dart';
import '../presentation/router_detail_screen/router_detail_screen.dart';
import '../presentation/edit_network_screen/edit_network_screen.dart';
import '../presentation/edit_guest_network_screen/edit_guest_network_screen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';
  static const String networkWelcomeScreen = '/network_welcome_screen';
  static const String loginScreen = '/login_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String passwordResetConfirmationScreen =
      '/password_reset_confirmation_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String passwordResetConfirmationScreenTwo =
      '/password_reset_confirmation_screen_two';
  static const String homeScreen = '/home_screen';
  static const String networkDashboardScreen = '/network_dashboard_screen';
  static const String networkHealthScreen = '/network_health_screen';
  static const String networkHealthScreenInitialPage =
      '/network_health_screen_initial_page';
  static const String addDeviceSetupScreen = '/add_device_setup_screen';
  static const String deviceConfigurationScreen =
      '/device_configuration_screen';
  static const String deviceConfigurationSuccessScreen =
      '/device_configuration_success_screen';
  static const String familyWiFiManagementScreen =
      '/family_wi_fi_management_screen';
  static const String addFamilyWiFiGroupScreen =
      '/add_family_wi_fi_group_screen';
  static const String associateSchedulesScreen = '/associate_schedules_screen';
  static const String groupDetailScreen = '/group_detail_screen';
  static const String addDevicesScreen = '/add_devices_screen';
  static const String newScheduleCreationScreen =
      '/new_schedule_creation_screen';
  static const String groupSelectionScreen = '/group_selection_screen';
  static const String scheduleDetailScreen = '/schedule_detail_screen';
  static const String speedTestProgressScreen = '/speed_test_progress_screen';
  static const String speedTestHistoryScreen = '/speed_test_history_screen';
  static const String speedTestResultsScreen = '/speed_test_results_screen';
  static const String deviceManagementScreen = '/device_management_screen';
  static const String networkDevicesManagementScreen =
      '/network_devices_management_screen';
  static const String routerDetailScreen = '/router_detail_screen';
  static const String editNetworkScreen = '/edit_network_screen';
  static const String editGuestNetworkScreen = '/edit_guest_network_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
    onboardingScreen: OnboardingScreen.builder,
    networkWelcomeScreen: NetworkWelcomeScreen.builder,
    loginScreen: LoginScreen.builder,
    forgotPasswordScreen: ForgotPasswordScreen.builder,
    passwordResetConfirmationScreen: PasswordResetConfirmationScreen.builder,
    signUpScreen: SignUpScreen.builder,
    passwordResetConfirmationScreenTwo:
        PasswordResetConfirmationScreenTwo.builder,
    homeScreen: HomeScreen.builder,
    networkDashboardScreen: NetworkDashboardScreen.builder,
    networkHealthScreen: NetworkHealthScreen.builder,
    addDeviceSetupScreen: AddDeviceSetupScreen.builder,
    deviceConfigurationScreen: DeviceConfigurationScreen.builder,
    deviceConfigurationSuccessScreen: DeviceConfigurationSuccessScreen.builder,
    familyWiFiManagementScreen: FamilyWiFiManagementScreen.builder,
    addFamilyWiFiGroupScreen: AddFamilyWiFiGroupScreen.builder,
    associateSchedulesScreen: AssociateSchedulesScreen.builder,
    groupDetailScreen: GroupDetailScreen.builder,
    addDevicesScreen: AddDevicesScreen.builder,
    newScheduleCreationScreen: NewScheduleCreationScreen.builder,
    groupSelectionScreen: GroupSelectionScreen.builder,
    scheduleDetailScreen: ScheduleDetailScreen.builder,
    speedTestProgressScreen: SpeedTestProgressScreen.builder,
    speedTestHistoryScreen: SpeedTestHistoryScreen.builder,
    speedTestResultsScreen: SpeedTestResultsScreen.builder,
    deviceManagementScreen: DeviceManagementScreen.builder,
    networkDevicesManagementScreen: NetworkDevicesManagementScreen.builder,
    routerDetailScreen: RouterDetailScreen.builder,
    editNetworkScreen: EditNetworkScreen.builder,
    editGuestNetworkScreen: EditGuestNetworkScreen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: AppNavigationScreen.builder,
  };
}
