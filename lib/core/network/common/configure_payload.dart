import 'package:json_annotation/json_annotation.dart';

part 'configure_payload.g.dart';

@JsonSerializable(includeIfNull: false)
class ConfigurePayload {
  @JsonKey(name: 'ssid')
  EditNetworkItem? editNetworkItem;

  @JsonKey(name: 'client')
  List<ClientItem>? clientItems;

  ConfigurePayload({this.editNetworkItem, this.clientItems});

  factory ConfigurePayload.fromJson(Map<String, dynamic> json) =>
      _$ConfigurePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurePayloadToJson(this);

  // Use this for renaming SSIDs or changing passwords
  factory ConfigurePayload.forSsidEdit({
    required String name,
    required String password,
  }) {
    return ConfigurePayload(
      editNetworkItem: EditNetworkItem(name: name, password: password),
    );
  }

  /// Use this for pausing/resuming specific client devices
  factory ConfigurePayload.forClientPause({
    required String mac,
    required bool pause,
  }) {
    return ConfigurePayload(
      clientItems: [ClientItem(mac: mac, access: pause ? 'deny' : 'allow')],
    );
  }
}

@JsonSerializable()
class EditNetworkItem {
  String? name;
  String? password;

  EditNetworkItem({this.name, this.password});

  factory EditNetworkItem.fromJson(Map<String, dynamic> json) =>
      _$EditNetworkItemFromJson(json);

  Map<String, dynamic> toJson() => _$EditNetworkItemToJson(this);
}

@JsonSerializable()
class ClientItem {
  String? mac;
  String? access;

  ClientItem({this.mac, this.access});

  factory ClientItem.fromJson(Map<String, dynamic> json) =>
      _$ClientItemFromJson(json);

  Map<String, dynamic> toJson() => _$ClientItemToJson(this);
}
