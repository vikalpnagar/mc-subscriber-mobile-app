import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_image_view.dart';
import './provider/network_welcome_provider.dart';

class NetworkWelcomeScreen extends StatefulWidget {
  const NetworkWelcomeScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<NetworkWelcomeProvider>(
      create: (context) => NetworkWelcomeProvider(),
      child: const NetworkWelcomeScreen(),
    );
  }

  @override
  State<NetworkWelcomeScreen> createState() => _NetworkWelcomeScreenState();
}

class _NetworkWelcomeScreenState extends State<NetworkWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetworkWelcomeProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      body: Consumer<NetworkWelcomeProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgDepth4Frame0320x390,
                  height: 320.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 26.h),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.66,
                        child: Text(
                          'Manage your home network',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.instance.headline28BoldInter
                              .copyWith(height: 1.25),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Take control of your home network with our easy-to-use app. Monitor devices, manage settings, and ensure a secure connection for your family.',
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.instance.title16RegularInter
                            .copyWith(color: appTheme.white_A700, height: 1.5),
                      ),
                      SizedBox(height: 22.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(
                          spacing: 12.h,
                          children: [
                            CustomButton(
                              text: 'Log In',
                              onPressed: () => provider.onLogInPressed(),
                              backgroundColor: appTheme.blue_700,
                              textColor: appTheme.white_A700,
                              fontSize: 16.fSize,
                              fontWeight: FontWeight.w700,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.h,
                                vertical: 12.h,
                              ),
                            ),
                            CustomButton(
                              text: 'Sign Up',
                              onPressed: () => provider.onSignUpPressed(),
                              backgroundColor: appTheme.blue_gray_900,
                              textColor: appTheme.white_A700,
                              fontSize: 16.fSize,
                              fontWeight: FontWeight.w700,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.h,
                                vertical: 12.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 116.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Text(
                          'By continuing, you agree to our Terms of Service and Privacy Policy.',
                          textAlign: TextAlign.center,
                          style: TextStyleHelper.instance.body14RegularInter
                              .copyWith(height: 1.5),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: double.infinity,
                        height: 20.h,
                        color: appTheme.gray_900,
                      ),
                    ],
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
