/// This class is used in the [login_screen] screen.

// ignore_for_file: must_be_immutable
class LoginModel {
  LoginModel({
    this.email,
    this.password,
    this.isSuccess,
    this.errorMessage,
  }) {
    email = email ?? '';
    password = password ?? '';
    isSuccess = isSuccess ?? false;
    errorMessage = errorMessage ?? '';
  }

  String? email;
  String? password;
  bool? isSuccess;
  String? errorMessage;

  LoginModel copyWith({
    String? email,
    String? password,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return LoginModel(
      email: email ?? this.email,
      password: password ?? this.password,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
