import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './provider/speed_test_results_provider.dart';

class SpeedTestResultsScreen extends StatefulWidget {
  const SpeedTestResultsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SpeedTestResultsProvider>(
      create: (context) => SpeedTestResultsProvider()..initialize(),
      child: const SpeedTestResultsScreen(),
    );
  }

  @override
  State<SpeedTestResultsScreen> createState() => _SpeedTestResultsScreenState();
}

class _SpeedTestResultsScreenState extends State<SpeedTestResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Speed Test Details',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<SpeedTestResultsProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 16.h,
                right: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 44.h,
                children: [
                  Text(
                    'Test Results',
                    style: TextStyleHelper.instance.title22BoldInter
                        .copyWith(height: 1.23),
                  ),
                  _buildTestResultsSection(provider),
                  _buildAdditionalResultsSection(provider),
                  _buildPerformanceSection(provider),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTestResultsSection(SpeedTestResultsProvider provider) {
    return Column(
      spacing: 16.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Download Speed',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(height: 1.21),
            ),
            Text(
              provider.speedTestModel.downloadSpeed ?? '125 Mbps',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(color: appTheme.white_A700, height: 1.21),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upload Speed',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(height: 1.21),
            ),
            Text(
              provider.speedTestModel.uploadSpeed ?? '45 Mbps',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(color: appTheme.white_A700, height: 1.21),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ping',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(height: 1.21),
            ),
            Text(
              provider.speedTestModel.ping ?? '15 ms',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(color: appTheme.white_A700, height: 1.21),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalResultsSection(SpeedTestResultsProvider provider) {
    return Column(
      spacing: 16.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jitter',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(height: 1.21),
            ),
            Text(
              provider.speedTestModel.jitter ?? '2 ms',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(color: appTheme.white_A700, height: 1.21),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date & Time',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(height: 1.21),
            ),
            Text(
              provider.speedTestModel.dateTime ?? 'July 26, 2024, 10:30 AM',
              style: TextStyleHelper.instance.body14RegularInter
                  .copyWith(color: appTheme.white_A700, height: 1.21),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPerformanceSection(SpeedTestResultsProvider provider) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Speed Test Performance',
            style: TextStyleHelper.instance.title16MediumInter
                .copyWith(height: 1.25),
          ),
          SizedBox(height: 6.h),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.42,
            child: Text(
              provider.speedTestModel.performanceSpeed ?? '125 Mbps',
              style: TextStyleHelper.instance.headline32BoldInter
                  .copyWith(height: 1.22),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                'Last 60 seconds',
                style: TextStyleHelper.instance.title16RegularInter
                    .copyWith(color: appTheme.indigo_200, height: 1.25),
              ),
              SizedBox(width: 4.h),
              Text(
                provider.speedTestModel.performanceChange ?? '+10%',
                style: TextStyleHelper.instance.title16MediumInter
                    .copyWith(color: appTheme.green_A700, height: 1.25),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildSpeedChart(provider),
        ],
      ),
    );
  }

  Widget _buildSpeedChart(SpeedTestResultsProvider provider) {
    return Container(
      height: 200.h,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return Text('0s', style: TextStyleHelper.instance.body12);
                    case 15:
                      return Text('15s',
                          style: TextStyleHelper.instance.body12);
                    case 30:
                      return Text('30s',
                          style: TextStyleHelper.instance.body12);
                    case 45:
                      return Text('45s',
                          style: TextStyleHelper.instance.body12);
                    case 60:
                      return Text('60s',
                          style: TextStyleHelper.instance.body12);
                    default:
                      return Text('');
                  }
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: provider.chartDataPoints,
              isCurved: true,
              color: appTheme.blue_700,
              barWidth: 3.h,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1172D3).withAlpha(77),
                    Color(0xFF1172D3).withAlpha(0),
                  ],
                ),
              ),
            ),
          ],
          minX: 0,
          maxX: 60,
          minY: 80,
          maxY: 150,
        ),
      ),
    );
  }
}
