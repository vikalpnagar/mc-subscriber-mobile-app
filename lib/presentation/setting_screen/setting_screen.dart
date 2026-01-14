import 'package:family_wifi/core/app_export.dart';
import 'package:family_wifi/presentation/setting_screen/models/setting_model.dart';
import 'package:family_wifi/presentation/setting_screen/provider/setting_provider.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return Provider<SettingProvider>(
      create: (BuildContext context) {
        return SettingProvider();
      },
      child: const SettingScreen(),
    );
  }

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late final SettingProvider controller;

  @override
  void initState() {
    super.initState();
    controller = Provider.of<SettingProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return _buildMainContent();
  }

  Widget _buildMainContent() {
    return Padding(
      padding: EdgeInsetsGeometry.all(16.0),
      child: ListView.builder(
        itemCount: controller.settingItems.length,
        itemBuilder: (BuildContext context, int index) {
          final settingItem = controller.settingItems[index];
          return _buildSettingItem(settingItem);
        },
      ),
    );
  }

  Widget _buildSettingItem(SettingModel settingItem) {
    bool isHeader = settingItem.isHeader;
    return GestureDetector(
      onTap: settingItem.onTap,
      child: Padding(
        padding: isHeader
            ? const EdgeInsets.only(bottom: 8.0)
            : const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                settingItem.label,
                style: isHeader
                    ? TextStyleHelper.instance.title18BoldInter.copyWith(
                        color: appTheme.white_A700,
                      )
                    : TextStyleHelper.instance.title16RegularInter.copyWith(
                        color: appTheme.white_A700,
                      ),
              ),
            ),
            if (!isHeader)
              Icon(Icons.arrow_forward, color: appTheme.white_A700),
          ],
        ),
      ),
    );
  }
}
