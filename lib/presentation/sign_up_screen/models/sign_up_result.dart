import 'package:json_annotation/json_annotation.dart';
part 'sign_up_result.g.dart';

@JsonSerializable()
class SignUpResult {
  final String? id;
  final String? macAddress;
  final String? deviceID;
  final String? userId;
  final String? registrationId;
  final String? status;

  SignUpResult({
    required this.id,
    required this.macAddress,
    required this.deviceID,
    required this.userId,
    required this.registrationId,
    required this.status,
  });

  factory SignUpResult.fromJson(Map<String, dynamic> json) =>
      _$SignUpResultFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpResultToJson(this);
}
