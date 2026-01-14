import 'dart:async';

import 'package:family_wifi/core/network/api_constants.dart';
import 'package:family_wifi/core/network/api_exception.dart';
import 'package:family_wifi/core/network/api_helper.dart';
import 'package:family_wifi/core/network/result.dart';
import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:family_wifi/l10n/app_localization_extension.dart';

class HomeRepository {
  late final ApiHelper _apiHelper;

  HomeRepository(ApiHelper apiHelper) {
    this._apiHelper = apiHelper;
  }

  Future<Result> subscriber() async {
    try {
      Map<String, dynamic> result = await _apiHelper.request(
        ApiConstants.subscriber,
        requestType: RequestType.GET,
      );
      // LoginResult loginResult = LoginResult.fromJson(result);
      // if (loginResult.accessToken != null) {
      //   await saveAccessToken(loginResult.accessToken);
      //   return Result.success(loginResult);
      // } else {
      //   return Result.error(await 'invalid_login_result'.tr());
      // }
      return Result.success(true);
    } catch (error, stack) {
      logPrint('$error, \n$stack');
      return handleApiException(error);
    }
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
