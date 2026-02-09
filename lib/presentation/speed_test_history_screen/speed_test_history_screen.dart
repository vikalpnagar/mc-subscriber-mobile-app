import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import './provider/speed_test_history_provider.dart';
import './widgets/history_item_widget.dart';

class SpeedTestHistoryScreen extends StatefulWidget {
  const SpeedTestHistoryScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<SpeedTestHistoryProvider>(
      create: (context) => SpeedTestHistoryProvider(),
      child: const SpeedTestHistoryScreen(),
    );
  }

  @override
  State<SpeedTestHistoryScreen> createState() => _SpeedTestHistoryScreenState();
}

class _SpeedTestHistoryScreenState extends State<SpeedTestHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SpeedTestHistoryProvider>(context, listen: false)
          .initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray_900,
      appBar: CustomAppBar(
        title: 'Speed Test History',
        hasLeading: true,
        leadingIcon: ImageConstant.imgDepth4Frame0WhiteA700,
        onLeadingPressed: () => NavigatorService.goBack(),
      ),
      body: Consumer<SpeedTestHistoryProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.historyItems.length,
            itemBuilder: (context, index) {
              return HistoryItemWidget(
                historyItem: provider.historyItems[index],
                onTap: () =>
                    provider.onHistoryItemTapped(provider.historyItems[index]),
              );
            },
          );
        },
      ),
    );
  }
}
