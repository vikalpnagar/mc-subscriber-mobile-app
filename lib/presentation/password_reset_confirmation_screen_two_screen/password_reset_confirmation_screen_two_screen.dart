import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import './provider/password_reset_confirmation_screen_two_provider.dart';

class PasswordResetConfirmationScreenTwo extends StatefulWidget {
  const PasswordResetConfirmationScreenTwo({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PasswordResetConfirmationScreenTwoProvider>(
      create: (context) => PasswordResetConfirmationScreenTwoProvider(),
      child: const PasswordResetConfirmationScreenTwo(),
    );
  }

  @override
  State<PasswordResetConfirmationScreenTwo> createState() =>
      _PasswordResetConfirmationScreenTwoState();
}

class _PasswordResetConfirmationScreenTwoState
    extends State<PasswordResetConfirmationScreenTwo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PasswordResetConfirmationScreenTwoProvider>(context,
              listen: false)
          .initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: _buildAppBar(context),
      body: Consumer<PasswordResetConfirmationScreenTwoProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: _buildMainContent(context),
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
      title: 'Reset password',
      hasLeading: true,
      leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
      onLeadingPressed: () => NavigatorService.goBack(),
      backgroundColor: appTheme.gray_900,
      titleColor: appTheme.white_A700,
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Check your email',
            style: TextStyleHelper.instance.title22BoldInter
                .copyWith(height: 1.23),
          ),
          SizedBox(height: 19.h),
          Text(
            'We\'ve sent a link to your email address. Please check your inbox to set your password. After setting your password, return to the app and use the login button to access your account.',
            style: TextStyleHelper.instance.title16RegularInter
                .copyWith(color: appTheme.white_A700, height: 1.5),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context,
      PasswordResetConfirmationScreenTwoProvider provider) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        children: [
          CustomButton(
            text: 'Open email app',
            onPressed: provider.onOpenEmailApp,
            backgroundColor: appTheme.blue_700,
            textColor: appTheme.white_A700,
            fontSize: 16.fSize,
            fontWeight: FontWeight.w700,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 12.h),
          ),
        ],
      ),
    );
  }
}
