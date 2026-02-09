import 'dart:async';

import 'package:family_wifi/core/network/api_constants.dart';
import 'package:family_wifi/core/network/api_exception.dart';
import 'package:family_wifi/core/network/api_helper.dart';
import 'package:family_wifi/core/network/result.dart';
import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:family_wifi/core/utils/shared_preferences_helper.dart';
import 'package:family_wifi/l10n/app_localization_extension.dart';
import 'package:family_wifi/presentation/login_screen/models/login_model.dart';
import 'package:family_wifi/presentation/login_screen/models/login_result.dart';

class LoginRepository {
  late final ApiHelper _apiHelper;
  late final SharedPreferencesHelper _sharedPreferencesHelper;

  LoginRepository(
    ApiHelper apiHelper,
    SharedPreferencesHelper sharedPreferencesHelper,
  ) {
    this._apiHelper = apiHelper;
    this._sharedPreferencesHelper = sharedPreferencesHelper;
  }

  Future<Result> login(LoginModel loginModel) async {
    try {
      Map<String, dynamic> result = await _apiHelper.request(
        ApiConstants.login,
        requestType: RequestType.POST,
        requestBody: loginModel,
      );
      LoginResult loginResult = LoginResult.fromJson(result);
      if (loginResult.accessToken != null) {
        await saveAccessToken(loginResult.accessToken);
        return Result.success(loginResult);
      } else {
        return Result.error(await 'invalid_login_result'.tr());
      }
    } catch (error, stack) {
      logPrint('$error, \n$stack');
      return handleApiException(error);
    }
  }

  Future<void> saveAccessToken(accessToken) async {
    _apiHelper.accessToken = accessToken;
    return _sharedPreferencesHelper.setAccessToken(accessToken);
  }

  Future<void> removeAccessToken() async {
    return _sharedPreferencesHelper.removeAccessToken();
  }

  Future<Result> handleApiException(dynamic exception) async {
    if (exception is ApiException) {
      return Result.error(
        exception.translate ? await exception.message.tr() : exception.message,
      );
    } else if (exception is TimeoutException) {
      bool available = await ApiHelper.check(checkActiveInternet: true);
      return Result.error(
        available
            ? await 'unable_to_reach_server'.tr()
            : await 'out_of_coverage'.tr(),
      );
    } else {
      return Result.error(await 'something_went_wrong'.tr());
    }
  }
}
