import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/speed_test_results_model.dart';

class SpeedTestResultsProvider extends ChangeNotifier {
  SpeedTestResultsModel speedTestModel = SpeedTestResultsModel();
  List<FlSpot> chartDataPoints = [];

  void initialize() {
    speedTestModel = SpeedTestResultsModel(
      downloadSpeed: '125 Mbps',
      uploadSpeed: '45 Mbps',
      ping: '15 ms',
      jitter: '2 ms',
      dateTime: 'July 26, 2024, 10:30 AM',
      performanceSpeed: '125 Mbps',
      performanceChange: '+10%',
    );

    _generateChartData();
    notifyListeners();
  }

  void _generateChartData() {
    chartDataPoints = [
      FlSpot(0, 100),
      FlSpot(10, 90),
      FlSpot(20, 110),
      FlSpot(30, 95),
      FlSpot(40, 140),
      FlSpot(50, 120),
      FlSpot(60, 125),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
