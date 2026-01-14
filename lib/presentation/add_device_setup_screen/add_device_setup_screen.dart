import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/add_device_setup_provider.dart';

class AddDeviceSetupScreen extends StatefulWidget {
  const AddDeviceSetupScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<AddDeviceSetupProvider>(
      create: (context) => AddDeviceSetupProvider()..initialize(),
      child: const AddDeviceSetupScreen(),
    );
  }

  @override
  State<AddDeviceSetupScreen> createState() => _AddDeviceSetupScreenState();
}

class _AddDeviceSetupScreenState extends State<AddDeviceSetupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: _buildAppBar(context),
      body: Consumer<AddDeviceSetupProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        _buildMainTitle(context),
                        SizedBox(height: 14.h),
                        _buildDescription(context),
                        SizedBox(height: 22.h),
                        _buildMacAddressInput(context, provider),
                      ],
                    ),
                  ),
                ),
              ),
              _buildBottomSection(context, provider),
            ],
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: 'Add a device',
      hasLeading: true,
      leadingIcon: ImageConstant.imgDepth4Frame0WhiteA70024x24,
      onLeadingPressed: () => Navigator.pop(context),
    );
  }

  Widget _buildMainTitle(BuildContext context) {
    return Text(
      'Connect your device',
      style:
          TextStyleHelper.instance.headline24BoldInter.copyWith(height: 1.25),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      'Connect your device to the internet and enter the MAC address below. We\'ll automatically detect it once it\'s online.',
      style: TextStyleHelper.instance.title16RegularInter
          .copyWith(color: appTheme.white_A700, height: 1.5),
    );
  }

  Widget _buildMacAddressInput(
      BuildContext context, AddDeviceSetupProvider provider) {
    return CustomEditText(
      controller: provider.macAddressController,
      hintText: 'MAC Address',
      inputType: CustomInputType.text,
      backgroundColor: appTheme.blue_gray_900,
      hasBorder: false,
      contentPadding: EdgeInsets.all(16.h),
      validator: (value) => provider.validateMacAddress(value),
    );
  }

  Widget _buildBottomSection(
      BuildContext context, AddDeviceSetupProvider provider) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
      child: CustomButton(
        text: 'Next',
        onPressed:
            provider.isLoading ? null : () => provider.onNextPressed(context),
        backgroundColor: appTheme.blue_700,
        textColor: appTheme.white_A700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
        width: double.infinity,
      ),
    );
  }
}
