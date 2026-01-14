// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResult _$SignUpResultFromJson(Map<String, dynamic> json) => SignUpResult(
  id: json['id'] as String?,
  macAddress: json['macAddress'] as String?,
  deviceID: json['deviceID'] as String?,
  userId: json['userId'] as String?,
  registrationId: json['registrationId'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$SignUpResultToJson(SignUpResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'macAddress': instance.macAddress,
      'deviceID': instance.deviceID,
      'userId': instance.userId,
      'registrationId': instance.registrationId,
      'status': instance.status,
    };
