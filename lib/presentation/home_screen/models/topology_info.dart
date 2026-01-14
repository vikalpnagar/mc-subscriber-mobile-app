import 'package:json_annotation/json_annotation.dart';
part 'topology_info.g.dart';

@JsonSerializable()
class TopologyInfo {
  String? boardId;
  List<Node>? nodes;
  DateTime? timestamp;

  TopologyInfo({this.boardId, this.nodes, this.timestamp});

  factory TopologyInfo.fromJson(Map<String, dynamic> json) =>
      _$TopologyInfoFromJson(json);
  Map<String, dynamic> toJson() => _$TopologyInfoToJson(this);
}

@JsonSerializable()
class Node {
  List<AccessPoint>? aps;
  String? serial;

  Node({this.aps, this.serial});

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
  Map<String, dynamic> toJson() => _$NodeToJson(this);
}

@JsonSerializable()
class AccessPoint {
  String? band;
  String? bssid;
  int? channel;
  List<Client>? clients;
  String? mode;
  String? ssid;
  DateTime? timestamp;

  AccessPoint({
    this.band,
    this.bssid,
    this.channel,
    this.clients,
    this.mode,
    this.ssid,
    this.timestamp,
  });

  factory AccessPoint.fromJson(Map<String, dynamic> json) =>
      _$AccessPointFromJson(json);
  Map<String, dynamic> toJson() => _$AccessPointToJson(this);
}

@JsonSerializable()
class Client {
  int? connected;
  int? inactive;
  int? rssi;
  int? rxRateBitrate;
  int? rxRateChwidth;
  String? station;
  int? txRateBitrate;

  Client({
    this.connected,
    this.inactive,
    this.rssi,
    this.rxRateBitrate,
    this.rxRateChwidth,
    this.station,
    this.txRateBitrate,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
  Map<String, dynamic> toJson() => _$ClientToJson(this);
}
