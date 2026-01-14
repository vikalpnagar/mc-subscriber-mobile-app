import 'package:family_wifi/core/utils/navigator_service.dart';
import 'package:family_wifi/presentation/setting_screen/models/setting_model.dart';
import 'package:family_wifi/routes/app_routes.dart';

class SettingProvider {
  List<SettingModel> settingItems = [
    SettingModel(label: 'Account Settings', isHeader: true),
    SettingModel(
      label: 'Logout',
      onTap: () {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.loginScreen);
      },
    ),
  ];

  void initialize() {
    // Put any initialization logic here
  }
}
