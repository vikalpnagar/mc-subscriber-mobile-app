import 'dart:async';

import 'package:family_wifi/core/network/api_helper.dart';
import 'package:family_wifi/core/utils/shared_preferences_helper.dart';

class OnboardingRepository {
  late final ApiHelper _apiHelper;
  late final SharedPreferencesHelper _sharedPreferencesHelper;

  OnboardingRepository(
    ApiHelper apiHelper,
    SharedPreferencesHelper sharedPreferencesHelper,
  ) {
    this._apiHelper = apiHelper;
    this._sharedPreferencesHelper = sharedPreferencesHelper;
  }

  Future<String?> getAccessToken() {
    return _sharedPreferencesHelper.accessToken;
  }

  Future<bool> shouldAutoLogin() async {
    String? accessToken = await getAccessToken();
    if (accessToken?.isNotEmpty ?? false) {
      _apiHelper.accessToken = accessToken;
      return true;
    }
    return false;
  }
}
