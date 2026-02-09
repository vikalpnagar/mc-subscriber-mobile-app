/// This class is used in the [forgot_password_screen] screen.

// ignore_for_file: must_be_immutable
class ForgotPasswordModel {
  ForgotPasswordModel({this.email, this.isEmailValid}) {
    email = email ?? '';
    isEmailValid = isEmailValid ?? false;
  }

  String? email;
  bool? isEmailValid;
}
