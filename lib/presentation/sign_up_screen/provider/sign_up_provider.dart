import 'package:family_wifi/core/network/result.dart';
import 'package:family_wifi/core/utils/alert_state_provider.dart';
import 'package:family_wifi/core/utils/base_bloc.dart';
import 'package:family_wifi/core/utils/loading_state_provider.dart';
import 'package:family_wifi/core/utils/navigator_service.dart';
import 'package:family_wifi/l10n/app_localization_extension.dart';
import 'package:family_wifi/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:family_wifi/presentation/sign_up_screen/repository/sign_up_repository.dart';
import 'package:family_wifi/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SignUpProvider with BaseBloc {
  SignUpModel signUpModel = SignUpModel();
  TextEditingController emailController = TextEditingController();
  TextEditingController operatorIdController = TextEditingController();
  TextEditingController macAddressController = TextEditingController();

  late final SignUpRepository _repository;

  SignUpProvider(
    LoadingStateProvider loadingStateProvider,
    AlertStateProvider alertStateProvider,
    this._repository,
  ) {
    initialize(loadingStateProvider, alertStateProvider);
  }

  @override
  void dispose() {
    emailController.dispose();
    operatorIdController.dispose();
    macAddressController.dispose();
    super.dispose();
  }

  void init() {
    // Add any initializations here
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? validateOperatorId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Operator ID is required';
    }

    return null;
  }

  String? validateMacAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'MAC address is required';
    }

    final macRegex = RegExp(r'^([0-9a-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');
    if (!macRegex.hasMatch(value.trim())) {
      return 'Please enter a valid MAC address';
    }

    return null;
  }

  Future<void> onNextPressed(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    startLoading();

    try {
      signUpModel.email = emailController.text.trim();
      signUpModel.operatorId = operatorIdController.text.trim();

      RegExp specialChars = RegExp(r'[^\w]+');
      signUpModel.macAddress = macAddressController.text
          .replaceAll(specialChars, '')
          .toLowerCase();

      Result result = await _repository.createAccount(signUpModel);

      dismissLoading();
      if (result.isSuccess) {
        NavigatorService.popAndPushNamed(
          AppRoutes.passwordResetConfirmationScreenTwo,
        );
      } else {
        showAlert(result.message, title: await 'signup_failed'.tr());
      }
    } catch (error) {
      dismissLoading();

      // Handle error
      print('Sign up error: $error');
    }
  }
}
