// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_network_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditNetworkModel _$EditNetworkModelFromJson(Map<String, dynamic> json) =>
    EditNetworkModel(
      ssid: json['ssid'] as String?,
      password: json['password'] as String?,
      mac: json['mac'] as String?,
      when: (json['when'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EditNetworkModelToJson(EditNetworkModel instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'password': instance.password,
      'mac': instance.mac,
      'when': instance.when,
    };
