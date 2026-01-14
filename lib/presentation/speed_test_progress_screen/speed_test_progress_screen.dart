import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import './provider/speed_test_progress_provider.dart';

class SpeedTestProgressScreen extends StatefulWidget {
  const SpeedTestProgressScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SpeedTestProgressProvider>(
        create: (context) => SpeedTestProgressProvider()..initialize(),
        child: const SpeedTestProgressScreen());
  }

  @override
  State<SpeedTestProgressScreen> createState() =>
      _SpeedTestProgressScreenState();
}

class _SpeedTestProgressScreenState extends State<SpeedTestProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.gray_900,
        appBar: CustomAppBar(
            title: 'Speed Test',
            hasLeading: true,
            leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
            onLeadingPressed: () => NavigatorService.goBack()),
        body: Consumer<SpeedTestProgressProvider>(
            builder: (context, provider, child) {
          return SingleChildScrollView(
              padding: EdgeInsets.only(top: 12.h, left: 16.h, right: 16.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 6.h),
                    Text('Your speed test is in progress',
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.instance.headline28BoldInter
                            .copyWith(height: 1.25)),
                    SizedBox(height: 24.h),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              '${provider.speedTestModel.progressPercentage ?? 60}% complete',
                              style: TextStyleHelper.instance.title16MediumInter
                                  .copyWith(height: 1.25)),
                          SizedBox(height: 10.h),
                          Container(
                              width: double.infinity,
                              height: 8.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.h)),
                              child: LinearProgressIndicator(
                                  value: (provider.speedTestModel
                                              .progressPercentage ??
                                          60) /
                                      100,
                                  backgroundColor: appTheme.blue_gray_700,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      appTheme.blue_700),
                                  minHeight: 8.h)),
                        ]),
                    SizedBox(height: 20.h),
                    Text(
                        'This may take a few minutes. Please keep the app open and connected to your network.',
                        textAlign: TextAlign.center,
                        style: TextStyleHelper.instance.title16RegularInter
                            .copyWith(color: appTheme.white_A700, height: 1.5)),
                    SizedBox(height: 26.h),
                    Column(children: [
                      Row(children: [
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.symmetric(vertical: 18.h),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: appTheme.gray_200,
                                            width: 1.h))),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Download Speed',
                                          style: TextStyleHelper
                                              .instance.body14RegularInter
                                              .copyWith(height: 1.21)),
                                      SizedBox(height: 6.h),
                                      Text(
                                          provider.speedTestModel
                                                  .downloadSpeed ??
                                              '250 Mbps',
                                          style: TextStyleHelper
                                              .instance.body14RegularInter
                                              .copyWith(
                                                  color: appTheme.white_A700,
                                                  height: 1.21)),
                                    ]))),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: 18.h, bottom: 18.h, left: 8.h),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: appTheme.gray_200,
                                            width: 1.h))),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Upload Speed',
                                          style: TextStyleHelper
                                              .instance.body14RegularInter
                                              .copyWith(height: 1.21)),
                                      SizedBox(height: 6.h),
                                      Text(
                                          provider.speedTestModel.uploadSpeed ??
                                              '150 Mbps',
                                          style: TextStyleHelper
                                              .instance.body14RegularInter
                                              .copyWith(
                                                  color: appTheme.white_A700,
                                                  height: 1.21)),
                                    ]))),
                      ]),
                      Container(
                          width: double.infinity,
                          height: 88.h,
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: appTheme.gray_200, width: 1.h)))),
                    ]),
                    SizedBox(height: 136.h),
                    Column(children: [
                      CustomButton(
                          text: 'Re-run Speed Test',
                          onPressed: () => provider.rerunSpeedTest(),
                          backgroundColor: appTheme.blue_700,
                          width: double.infinity,
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w700,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.h, vertical: 10.h)),
                      SizedBox(height: 12.h),
                      CustomButton(
                          text: 'View History',
                          onPressed: () => provider.navigateToHistory(context),
                          backgroundColor: appTheme.blue_gray_900,
                          width: double.infinity,
                          fontSize: 14.fSize,
                          fontWeight: FontWeight.w700,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.h, vertical: 10.h)),
                    ]),
                    SizedBox(height: 20.h),
                  ]));
        }));
  }
}
