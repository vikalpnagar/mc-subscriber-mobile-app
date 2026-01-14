import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const _firstRun = 'firstRun';
  static const _accessToken = 'accessToken';

  late final SharedPreferencesAsync _sharedPreference;

  SharedPreferencesHelper._() {
    _sharedPreference = SharedPreferencesAsync();
  }

  static final SharedPreferencesHelper _shared = SharedPreferencesHelper._();

  factory SharedPreferencesHelper() => _shared;

  Future<void> setFirstRun(bool value) async {
    return _sharedPreference.setBool(_firstRun, value);
  }

  Future<bool?> get isFirstRun => _sharedPreference.getBool(_firstRun);

  Future<void> setAccessToken(String value) async {
    return _sharedPreference.setString(_accessToken, value);
  }

  Future<String?> get accessToken => _sharedPreference.getString(_accessToken);

  Future<void> removeAccessToken() async {
    return _sharedPreference.remove(_accessToken);
  }

  void dispose() {}
}
