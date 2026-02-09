import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  LoginModel({this.userId, this.password}) {
    userId = userId ?? '';
    password = password ?? '';
  }

  String? userId;
  String? password;

  LoginModel copyWith({String? userId, String? password}) {
    return LoginModel(
      userId: userId ?? this.userId,
      password: password ?? this.password,
    );
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
