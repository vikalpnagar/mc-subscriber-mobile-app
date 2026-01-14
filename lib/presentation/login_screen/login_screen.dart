import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appTheme.gray_900,
        appBar: CustomAppBar(
          title: 'Login',
          hasLeading: true,
          leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
          onLeadingPressed: () => NavigatorService.goBack(),
          backgroundColor: appTheme.gray_900,
          titleColor: appTheme.white_A700,
        ),
        body: Consumer<LoginProvider>(
          builder: (context, provider, child) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        CustomEditText(
                          controller: provider.emailController,
                          hintText: 'Email',
                          inputType: CustomInputType.email,
                          backgroundColor: appTheme.blue_gray_900,
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          validator: provider.validateEmail,
                        ),
                        SizedBox(height: 24.h),
                        CustomEditText(
                          controller: provider.passwordController,
                          hintText: 'Password',
                          inputType: CustomInputType.password,
                          backgroundColor: appTheme.blue_gray_900,
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          validator: provider.validatePassword,
                        ),
                        SizedBox(height: 18.h),
                        GestureDetector(
                          onTap: () {
                            NavigatorService.pushNamed(
                              AppRoutes.forgotPasswordScreen,
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 16.h),
                            child: Text(
                              'Forgot Password?',
                              style:
                                  TextStyleHelper.instance.body14RegularInter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'Login',
                          onPressed: provider.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState?.validate() ==
                                      true) {
                                    provider.onLoginPressed();
                                  }
                                },
                          backgroundColor: appTheme.blue_700,
                          textColor: appTheme.whiteCustom,
                          fontSize: 16.fSize,
                          fontWeight: FontWeight.w700,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 12.h),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
