import 'package:family_wifi/core/network/api_helper.dart';
import 'package:family_wifi/core/utils/alert_state_provider.dart';
import 'package:family_wifi/core/utils/loading_state_provider.dart';
import 'package:family_wifi/core/utils/shared_preferences_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/single_child_widget.dart';

import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 🚨 CRITICAL: Device orientation lock - DO NOT REMOVE
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _buildProviders(),
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Family WiFi',
            debugShowCheckedModeBanner: false,
            theme: theme,
            // 🚨 CRITICAL: NEVER REMOVE OR MODIFY
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(1.0)),
                child: child!,
              );
            },
            // 🚨 END CRITICAL SECTION
            navigatorKey: NavigatorService.navigatorKey,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [Locale('en', '')],
            initialRoute: AppRoutes.onboardingScreen,
            routes: AppRoutes.routes,
          );
        },
      ),
    );
  }

  List<SingleChildWidget> _buildProviders() {
    return [
      Provider<ApiHelper>(create: (_) => ApiHelper()),
      Provider(create: (_) => SharedPreferencesHelper()),
    ];
  }

  static Widget buildLoadingAlertProviders({Widget? child}) {
    return ChangeNotifierProvider<LoadingStateProvider>.value(
      value: LoadingStateProvider(false),
      child: ChangeNotifierProvider<AlertStateProvider>.value(
        value: AlertStateProvider(false),
        child: child,
      ),
    );
  }
}
