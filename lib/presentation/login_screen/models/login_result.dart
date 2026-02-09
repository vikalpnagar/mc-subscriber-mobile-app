import 'package:json_annotation/json_annotation.dart';
part 'login_result.g.dart';

@JsonSerializable()
class LoginResult {
  @JsonKey(name: 'username')
  final String? userName;

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  @JsonKey(name: 'token_type')
  final String? tokenType;

  LoginResult({
    required this.userName,
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
