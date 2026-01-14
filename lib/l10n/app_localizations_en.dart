// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Family WiFi';

  @override
  String get alert => 'Alert';

  @override
  String get success => 'Success';

  @override
  String get failed => 'Failed';

  @override
  String get signup_failed => 'Sign up Failed';

  @override
  String get login_failed => 'Login Failed';

  @override
  String get unable_to_reach_server => 'Unable to reach server at the moment.';

  @override
  String get out_of_coverage => 'Please check your internet connection.';

  @override
  String get something_went_wrong =>
      'Something went wrong. Pls try again later.';

  @override
  String get invalid_signup_result =>
      'Invalid signup response received from server.';
}
