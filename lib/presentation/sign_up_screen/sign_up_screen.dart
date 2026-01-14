import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_edit_text.dart';
import './provider/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SignUpProvider>(
      create: (context) => SignUpProvider(),
      child: const SignUpScreen(),
    );
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SignUpProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appTheme.gray_900,
        appBar: CustomAppBar(
          title: 'Sign up',
          hasLeading: true,
          leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
          onLeadingPressed: () => NavigatorService.goBack(),
        ),
        body: Consumer<SignUpProvider>(
          builder: (context, provider, child) {
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            "Let's get started",
                            style: TextStyleHelper.instance.title22BoldInter,
                          ),
                          SizedBox(height: 19.h),
                          Text(
                            'Enter your email address, operator ID, and the MAC address of your first router.',
                            style: TextStyleHelper.instance.title16RegularInter
                                .copyWith(color: appTheme.white_A700),
                          ),
                          SizedBox(height: 46.h),
                          CustomEditText(
                            controller: provider.emailController,
                            hintText: 'Email address',
                            inputType: CustomInputType.email,
                            backgroundColor: appTheme.blue_gray_900,
                            validator: provider.validateEmail,
                          ),
                          SizedBox(height: 24.h),
                          CustomEditText(
                            controller: provider.operatorIdController,
                            hintText: 'Operator ID',
                            backgroundColor: appTheme.blue_gray_900,
                            validator: provider.validateOperatorId,
                          ),
                          SizedBox(height: 24.h),
                          CustomEditText(
                            controller: provider.macAddressController,
                            hintText: 'MAC address of first router',
                            backgroundColor: appTheme.blue_gray_900,
                            validator: provider.validateMacAddress,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: CustomButton(
                      text: 'Next',
                      backgroundColor: appTheme.blue_700,
                      textColor: appTheme.white_A700,
                      fontSize: 16.fSize,
                      fontWeight: FontWeight.w700,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 12.h),
                      onPressed: provider.isLoading
                          ? null
                          : () {
                              provider.onNextPressed(_formKey);
                            },
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
