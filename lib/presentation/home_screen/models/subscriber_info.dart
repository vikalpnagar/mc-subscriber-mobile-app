import 'package:json_annotation/json_annotation.dart';
part 'subscriber_info.g.dart';

@JsonSerializable()
class SubscriberInfo {
  AccessPoints? accessPoints;
  Address? billingAddress;
  int? created;
  String? firstName;
  String? id;
  dynamic initials;
  String? lastName;
  int? modified;
  dynamic phoneNumber;
  dynamic secondaryEmail;
  Address? serviceAddress;
  String? userId;

  SubscriberInfo({
    this.accessPoints,
    this.billingAddress,
    this.created,
    this.firstName,
    this.id,
    this.initials,
    this.lastName,
    this.modified,
    this.phoneNumber,
    this.secondaryEmail,
    this.serviceAddress,
    this.userId,
  });

  bool get accessPointAvailable => accessPoints?.list?.isNotEmpty ?? false;

  AccessPoint? get firstAccessPoint =>
      accessPointAvailable ? accessPoints?.list?.first : null;

  String? get privateWiFiMacAddress => firstAccessPoint?.macAddress;

  String? get privateWiFiSSID => firstAccessPoint?.name;

  factory SubscriberInfo.fromJson(Map<String, dynamic> json) =>
      _$SubscriberInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriberInfoToJson(this);
}

@JsonSerializable()
class AccessPoints {
  List<AccessPoint>? list;

  AccessPoints({this.list});

  factory AccessPoints.fromJson(Map<String, dynamic> json) =>
      _$AccessPointsFromJson(json);
  Map<String, dynamic> toJson() => _$AccessPointsToJson(this);
}

@JsonSerializable()
class AccessPoint {
  Address? address;
  bool? automaticUpgrade;
  dynamic configurationUuid;
  String? currentFirmware;
  int? currentFirmwareDate;
  DeviceMode? deviceMode;
  String? deviceType;
  DnsConfiguration? dnsConfiguration;
  String? id;
  InternetConnection? internetConnection;
  IpReservations? ipReservations;
  String? latestFirmware;
  int? latestFirmwareDate;
  String? latestFirmwareUri;
  String? macAddress;
  String? name;
  bool? newFirmwareAvailable;
  List<Radio>? radios;
  String? serialNumber;
  SubscriberDevices? subscriberDevices;
  WifiNetworks? wifiNetworks;

  AccessPoint({
    this.address,
    this.automaticUpgrade,
    this.configurationUuid,
    this.currentFirmware,
    this.currentFirmwareDate,
    this.deviceMode,
    this.deviceType,
    this.dnsConfiguration,
    this.id,
    this.internetConnection,
    this.ipReservations,
    this.latestFirmware,
    this.latestFirmwareDate,
    this.latestFirmwareUri,
    this.macAddress,
    this.name,
    this.newFirmwareAvailable,
    this.radios,
    this.serialNumber,
    this.subscriberDevices,
    this.wifiNetworks,
  });

  factory AccessPoint.fromJson(Map<String, dynamic> json) =>
      _$AccessPointFromJson(json);
  Map<String, dynamic> toJson() => _$AccessPointToJson(this);
}

@JsonSerializable()
class Address {
  List<dynamic>? addressLines;
  dynamic buildingName;
  dynamic city;
  dynamic country;
  List<dynamic>? mobiles;
  List<dynamic>? phones;
  dynamic postal;
  dynamic state;

  Address({
    this.addressLines,
    this.buildingName,
    this.city,
    this.country,
    this.mobiles,
    this.phones,
    this.postal,
    this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class DeviceMode {
  int? created;
  bool? enableLeds;
  String? endIp;
  dynamic endIpv6;
  int? modified;
  String? startIp;
  dynamic startIpv6;
  String? subnet;
  String? subnetMask;
  int? subnetMaskV6;
  dynamic subnetV6;
  String? type;

  DeviceMode({
    this.created,
    this.enableLeds,
    this.endIp,
    this.endIpv6,
    this.modified,
    this.startIp,
    this.startIpv6,
    this.subnet,
    this.subnetMask,
    this.subnetMaskV6,
    this.subnetV6,
    this.type,
  });

  factory DeviceMode.fromJson(Map<String, dynamic> json) =>
      _$DeviceModeFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceModeToJson(this);
}

@JsonSerializable()
class DnsConfiguration {
  bool? isp;
  bool? custom;
  dynamic primary;
  dynamic primaryV6;
  dynamic secondary;
  String? secondaryV6;

  DnsConfiguration({
    this.isp,
    this.custom,
    this.primary,
    this.primaryV6,
    this.secondary,
    this.secondaryV6,
  });

  factory DnsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DnsConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$DnsConfigurationToJson(this);
}

@JsonSerializable()
class InternetConnection {
  int? created;
  String? defaultGateway;
  dynamic defaultGatewayV6;
  String? ipAddress;
  dynamic ipAddressV6;
  bool? ipV6Support;
  int? modified;
  dynamic password;
  String? primaryDns;
  dynamic primaryDnsV6;
  String? secondaryDns;
  dynamic secondaryDnsV6;
  bool? sendHostname;
  String? subnetMask;
  int? subnetMaskV6;
  String? type;
  dynamic username;

  InternetConnection({
    this.created,
    this.defaultGateway,
    this.defaultGatewayV6,
    this.ipAddress,
    this.ipAddressV6,
    this.ipV6Support,
    this.modified,
    this.password,
    this.primaryDns,
    this.primaryDnsV6,
    this.secondaryDns,
    this.secondaryDnsV6,
    this.sendHostname,
    this.subnetMask,
    this.subnetMaskV6,
    this.type,
    this.username,
  });

  factory InternetConnection.fromJson(Map<String, dynamic> json) =>
      _$InternetConnectionFromJson(json);
  Map<String, dynamic> toJson() => _$InternetConnectionToJson(this);
}

@JsonSerializable()
class IpReservations {
  int? created;
  dynamic id;
  int? modified;
  List<dynamic>? reservations;

  IpReservations({this.created, this.id, this.modified, this.reservations});

  factory IpReservations.fromJson(Map<String, dynamic> json) =>
      _$IpReservationsFromJson(json);
  Map<String, dynamic> toJson() => _$IpReservationsToJson(this);
}

@JsonSerializable()
class Radio {
  bool? allowDfs;
  String? band;
  int? bandwidth;
  int? beaconInterval;
  int? channel;
  String? channelMode;
  int? channelWidth;
  String? country;
  int? dtimPeriod;
  He? he;
  bool? legacyRates;
  int? maximumClients;
  dynamic mimo;
  Rates? rates;
  List<dynamic>? rawInfo;
  dynamic requireMode;
  int? txpower;

  Radio({
    this.allowDfs,
    this.band,
    this.bandwidth,
    this.beaconInterval,
    this.channel,
    this.channelMode,
    this.channelWidth,
    this.country,
    this.dtimPeriod,
    this.he,
    this.legacyRates,
    this.maximumClients,
    this.mimo,
    this.rates,
    this.rawInfo,
    this.requireMode,
    this.txpower,
  });

  factory Radio.fromJson(Map<String, dynamic> json) => _$RadioFromJson(json);
  Map<String, dynamic> toJson() => _$RadioToJson(this);
}

@JsonSerializable()
class He {
  int? bssColor;
  bool? ema;
  bool? multipleBssid;

  He({this.bssColor, this.ema, this.multipleBssid});

  factory He.fromJson(Map<String, dynamic> json) => _$HeFromJson(json);
  Map<String, dynamic> toJson() => _$HeToJson(this);
}

@JsonSerializable()
class Rates {
  int? beacon;
  int? multicast;

  Rates({this.beacon, this.multicast});

  factory Rates.fromJson(Map<String, dynamic> json) => _$RatesFromJson(json);
  Map<String, dynamic> toJson() => _$RatesToJson(this);
}

@JsonSerializable()
class SubscriberDevices {
  int? created;
  List<dynamic>? devices;
  int? modified;

  SubscriberDevices({this.created, this.devices, this.modified});

  factory SubscriberDevices.fromJson(Map<String, dynamic> json) =>
      _$SubscriberDevicesFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriberDevicesToJson(this);
}

@JsonSerializable()
class WifiNetworks {
  int? created;
  int? modified;
  List<WifiNetwork>? wifiNetworks;

  WifiNetworks({this.created, this.modified, this.wifiNetworks});

  factory WifiNetworks.fromJson(Map<String, dynamic> json) =>
      _$WifiNetworksFromJson(json);
  Map<String, dynamic> toJson() => _$WifiNetworksToJson(this);
}

@JsonSerializable()
class WifiNetwork {
  List<String>? bands;
  String? encryption;
  String? name;
  String? password;
  String? type;

  WifiNetwork({
    this.bands,
    this.encryption,
    this.name,
    this.password,
    this.type,
  });

  factory WifiNetwork.fromJson(Map<String, dynamic> json) =>
      _$WifiNetworkFromJson(json);
  Map<String, dynamic> toJson() => _$WifiNetworkToJson(this);
}
