import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/edit_network_provider.dart';

class EditNetworkScreen extends StatefulWidget {
  const EditNetworkScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<EditNetworkProvider>(
      create: (context) => EditNetworkProvider(),
      child: const EditNetworkScreen(),
    );
  }

  @override
  State<EditNetworkScreen> createState() => _EditNetworkScreenState();
}

class _EditNetworkScreenState extends State<EditNetworkScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EditNetworkProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72.h),
        child: CustomAppBar(
          title: 'Edit Network',
          hasLeading: true,
          leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
          onLeadingPressed: () => Navigator.pop(context),
          backgroundColor: appTheme.gray_900,
        ),
      ),
      body: Consumer<EditNetworkProvider>(
        builder: (context, provider, child) {
          return Form(
            key: provider.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.h),
                          _buildNetworkNameSection(context, provider),
                          SizedBox(height: 26.h),
                          _buildPasswordSection(context, provider),
                        ],
                      ),
                    ),
                  ),
                ),
                _buildSaveButton(context, provider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNetworkNameSection(
      BuildContext context, EditNetworkProvider provider) {
    return Column(
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
          validator: provider.validateNetworkName,
        ),
      ],
    );
  }

  Widget _buildPasswordSection(
      BuildContext context, EditNetworkProvider provider) {
    return Column(
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
          validator: provider.validatePassword,
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context, EditNetworkProvider provider) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomButton(
        text: 'Save Changes',
        onPressed: () => provider.saveChanges(context),
        backgroundColor: appTheme.blue_700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
        margin: EdgeInsets.only(bottom: 12.h),
      ),
    );
  }
}
