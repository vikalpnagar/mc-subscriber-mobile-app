import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../models/speed_test_history_model.dart';

class SpeedTestHistoryProvider extends ChangeNotifier {
  List<SpeedTestHistoryModel> _historyItems = [];

  List<SpeedTestHistoryModel> get historyItems => _historyItems;

  void initialize() {
    _historyItems = [
      SpeedTestHistoryModel(
        date: 'July 26, 2024, 10:30 AM',
        downloadSpeed: 'Download: 150 Mbps',
        uploadSpeed: 'Upload: 20 Mbps',
        id: '1',
      ),
      SpeedTestHistoryModel(
        date: 'July 25, 2024, 3:45 PM',
        downloadSpeed: 'Download: 120 Mbps',
        uploadSpeed: 'Upload: 18 Mbps',
        id: '2',
      ),
      SpeedTestHistoryModel(
        date: 'July 24, 2024, 9:15 AM',
        downloadSpeed: 'Download: 180 Mbps',
        uploadSpeed: 'Upload: 25 Mbps',
        id: '3',
      ),
      SpeedTestHistoryModel(
        date: 'July 23, 2024, 11:00 AM',
        downloadSpeed: 'Download: 160 Mbps',
        uploadSpeed: 'Upload: 22 Mbps',
        id: '4',
      ),
      SpeedTestHistoryModel(
        date: 'July 22, 2024, 2:20 PM',
        downloadSpeed: 'Download: 140 Mbps',
        uploadSpeed: 'Upload: 21 Mbps',
        id: '5',
      ),
      SpeedTestHistoryModel(
        date: 'July 21, 2024, 8:50 AM',
        downloadSpeed: 'Download: 170 Mbps',
        uploadSpeed: 'Upload: 24 Mbps',
        id: '6',
      ),
    ];
  }

  void onHistoryItemTapped(SpeedTestHistoryModel item) {
    NavigatorService.pushNamed(AppRoutes.speedTestResultsScreen);
  }
}
