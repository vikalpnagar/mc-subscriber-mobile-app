import 'package:json_annotation/json_annotation.dart';
part 'edit_network_model.g.dart';

@JsonSerializable()
class EditNetworkModel {
  EditNetworkModel({this.ssid, this.password, this.mac, this.when = 0}) {
    ssid = ssid ?? '';
    password = password ?? '';
  }

  String? ssid;
  String? password;
  String? mac;
  int when;

  EditNetworkModel copyWith({
    String? ssid,
    String? password,
    String? mac,
    int? when,
  }) {
    return EditNetworkModel(
      ssid: ssid ?? this.ssid,
      password: password ?? this.password,
      mac: mac ?? this.mac,
      when: when ?? this.when,
    );
  }

  factory EditNetworkModel.fromJson(Map<String, dynamic> json) =>
      _$EditNetworkModelFromJson(json);
  Map<String, dynamic> toJson() => _$EditNetworkModelToJson(this);
}
