import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/forgot_password_provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordProvider>(
      create: (context) => ForgotPasswordProvider(),
      child: const ForgotPasswordScreen(),
    );
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ForgotPasswordProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Forgot Password',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<ForgotPasswordProvider>(
        builder: (context, provider, child) {
          return Form(
            key: provider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20.h,
                          left: 16.h,
                        ),
                        child: Text(
                          'Enter your email',
                          style: TextStyleHelper.instance.title22BoldInter,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 18.h,
                          left: 16.h,
                        ),
                        child: Text(
                          'We\'ll send you a link to reset your password.',
                          style: TextStyleHelper.instance.title16RegularInter
                              .copyWith(color: appTheme.white_A700),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 22.h,
                          left: 16.h,
                          right: 16.h,
                        ),
                        child: CustomEditText(
                          controller: provider.emailController,
                          hintText: 'Email',
                          inputType: CustomInputType.email,
                          backgroundColor: appTheme.blue_gray_900,
                          hasBorder: false,
                          contentPadding: EdgeInsets.all(16.h),
                          validator: provider.validateEmail,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 16.h,
                    right: 16.h,
                    bottom: 12.h,
                  ),
                  child: CustomButton(
                    text: 'Send Reset Link',
                    onPressed: provider.isLoading
                        ? null
                        : () {
                            provider.onSendResetLink();
                          },
                    backgroundColor: appTheme.blue_700,
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w700,
                    textColor: appTheme.white_A700,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 12.h,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
