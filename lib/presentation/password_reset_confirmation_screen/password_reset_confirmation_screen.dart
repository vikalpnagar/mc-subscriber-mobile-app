import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import './provider/password_reset_confirmation_provider.dart';

class PasswordResetConfirmationScreen extends StatefulWidget {
  const PasswordResetConfirmationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<PasswordResetConfirmationProvider>(
      create: (context) => PasswordResetConfirmationProvider(),
      child: const PasswordResetConfirmationScreen(),
    );
  }

  @override
  State<PasswordResetConfirmationScreen> createState() =>
      _PasswordResetConfirmationScreenState();
}

class _PasswordResetConfirmationScreenState
    extends State<PasswordResetConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Forgot Password',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
        backgroundColor: appTheme.gray_900,
        titleColor: appTheme.white_A700,
      ),
      body: Consumer<PasswordResetConfirmationProvider>(
        builder: (context, provider, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        'Check your email',
                        style: TextStyleHelper.instance.title22BoldInter
                            .copyWith(height: 1.2),
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        'We\'ve sent a password reset link to your email address. Please check your inbox and follow the instructions to reset your password.',
                        style: TextStyleHelper.instance.title16RegularInter
                            .copyWith(color: appTheme.white_A700, height: 1.5),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: CustomButton(
                    text: 'Back to Login',
                    onPressed: () => provider.navigateToLogin(),
                    backgroundColor: appTheme.blue_700,
                    textColor: appTheme.white_A700,
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w700,
                    margin: EdgeInsets.only(bottom: 12.h),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: appTheme.gray_900,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
