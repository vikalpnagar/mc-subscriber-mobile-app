import 'dart:async';

import 'package:family_wifi/core/network/api_constants.dart';
import 'package:family_wifi/core/network/api_exception.dart';
import 'package:family_wifi/core/network/api_helper.dart';
import 'package:family_wifi/core/network/result.dart';
import 'package:family_wifi/core/utils/print_log_helper.dart';
import 'package:family_wifi/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:family_wifi/presentation/sign_up_screen/models/sign_up_result.dart';

class SignUpRepository {
  late final ApiHelper _apiHelper;

  SignUpRepository(ApiHelper apiHelper) {
    this._apiHelper = apiHelper;
  }

  Future<Result> createAccount(SignUpModel signUpModel) async {
    try {
      Map<String, dynamic> result = await _apiHelper.request(
        ApiConstants.signup,
        requestType: RequestType.POST,
        parameters: {
          'email': signUpModel.email,
          'macAddress': signUpModel.macAddress,
          'registrationId': signUpModel.operatorId,
        },
      );
      if (result.isNotEmpty &&
          result.containsKey('userId') &&
          ((result['userId'] as String?)?.isNotEmpty ?? false)) {
        SignUpResult signUpResult = SignUpResult.fromJson(result);
        return Result.success(signUpResult);
      } else {
        return Result.error('invalid_signup_result');
      }
    } catch (error, stack) {
      logPrint('$error, \n$stack');
      return handleApiException(error);
    }
  }

  Future<Result> handleApiException(dynamic exception) async {
    if (exception is ApiException) {
      return Result.error(exception.message);
    } else if (exception is TimeoutException) {
      bool available = await ApiHelper.check(checkActiveInternet: true);
      return Result.error(
        available ? 'unable_to_reach_server' : 'out_of_coverage',
      );
    } else {
      return Result.error('something_went_wrong');
    }
  }
}
