import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import '../../widgets/custom_switch.dart';
import './provider/edit_guest_network_provider.dart';

class EditGuestNetworkScreen extends StatefulWidget {
  const EditGuestNetworkScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EditGuestNetworkProvider>(
      create: (context) => EditGuestNetworkProvider(),
      child: const EditGuestNetworkScreen(),
    );
  }

  @override
  State<EditGuestNetworkScreen> createState() => _EditGuestNetworkScreenState();
}

class _EditGuestNetworkScreenState extends State<EditGuestNetworkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EditGuestNetworkProvider>(context, listen: false)
          .initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Edit Guest Network',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<EditGuestNetworkProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildGuestNetworkSection(provider),
                      _buildNetworkNameSection(provider),
                      _buildPasswordSection(provider),
                    ],
                  ),
                ),
              ),
              _buildSaveButton(provider),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGuestNetworkSection(EditGuestNetworkProvider provider) {
    return Container(
      width: double.infinity,
      color: appTheme.gray_900,
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Guest Network',
            style: TextStyleHelper.instance.title16RegularInter
                .copyWith(color: appTheme.white_A700),
          ),
          CustomSwitch(
            value:
                provider.editGuestNetworkModel.isGuestNetworkEnabled ?? false,
            onChanged: (value) {
              provider.toggleGuestNetwork(value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkNameSection(EditGuestNetworkProvider provider) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, left: 16.h, right: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Network Name (SSID)',
            style: TextStyleHelper.instance.title16MediumInter,
          ),
          SizedBox(height: 8.h),
          CustomEditText(
            controller: provider.networkNameController,
            hintText: 'Enter network name',
            backgroundColor: appTheme.blue_gray_900,
            contentPadding: EdgeInsets.all(12.h),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordSection(EditGuestNetworkProvider provider) {
    return Container(
      margin: EdgeInsets.only(top: 26.h, left: 16.h, right: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password (Key)',
            style: TextStyleHelper.instance.title16MediumInter,
          ),
          SizedBox(height: 6.h),
          CustomEditText(
            controller: provider.passwordController,
            hintText: 'Enter password',
            inputType: CustomInputType.password,
            backgroundColor: appTheme.blue_gray_900,
            contentPadding: EdgeInsets.all(12.h),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(EditGuestNetworkProvider provider) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomButton(
        text: 'Save Changes',
        onPressed: () {
          provider.saveChanges();
        },
        backgroundColor: appTheme.blue_700,
        margin: EdgeInsets.only(bottom: 12.h),
      ),
    );
  }
}
