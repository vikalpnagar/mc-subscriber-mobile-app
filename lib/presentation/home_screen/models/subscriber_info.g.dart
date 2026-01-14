// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriberInfo _$SubscriberInfoFromJson(Map<String, dynamic> json) =>
    SubscriberInfo(
      accessPoints: json['accessPoints'] == null
          ? null
          : AccessPoints.fromJson(json['accessPoints'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : Address.fromJson(json['billingAddress'] as Map<String, dynamic>),
      created: (json['created'] as num?)?.toInt(),
      firstName: json['firstName'] as String?,
      id: json['id'] as String?,
      initials: json['initials'],
      lastName: json['lastName'] as String?,
      modified: (json['modified'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'],
      secondaryEmail: json['secondaryEmail'],
      serviceAddress: json['serviceAddress'] == null
          ? null
          : Address.fromJson(json['serviceAddress'] as Map<String, dynamic>),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$SubscriberInfoToJson(SubscriberInfo instance) =>
    <String, dynamic>{
      'accessPoints': instance.accessPoints,
      'billingAddress': instance.billingAddress,
      'created': instance.created,
      'firstName': instance.firstName,
      'id': instance.id,
      'initials': instance.initials,
      'lastName': instance.lastName,
      'modified': instance.modified,
      'phoneNumber': instance.phoneNumber,
      'secondaryEmail': instance.secondaryEmail,
      'serviceAddress': instance.serviceAddress,
      'userId': instance.userId,
    };

AccessPoints _$AccessPointsFromJson(Map<String, dynamic> json) => AccessPoints(
  list: (json['list'] as List<dynamic>?)
      ?.map((e) => AccessPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AccessPointsToJson(AccessPoints instance) =>
    <String, dynamic>{'list': instance.list};

AccessPoint _$AccessPointFromJson(Map<String, dynamic> json) => AccessPoint(
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  automaticUpgrade: json['automaticUpgrade'] as bool?,
  configurationUuid: json['configurationUuid'],
  currentFirmware: json['currentFirmware'] as String?,
  currentFirmwareDate: (json['currentFirmwareDate'] as num?)?.toInt(),
  deviceMode: json['deviceMode'] == null
      ? null
      : DeviceMode.fromJson(json['deviceMode'] as Map<String, dynamic>),
  deviceType: json['deviceType'] as String?,
  dnsConfiguration: json['dnsConfiguration'] == null
      ? null
      : DnsConfiguration.fromJson(
          json['dnsConfiguration'] as Map<String, dynamic>,
        ),
  id: json['id'] as String?,
  internetConnection: json['internetConnection'] == null
      ? null
      : InternetConnection.fromJson(
          json['internetConnection'] as Map<String, dynamic>,
        ),
  ipReservations: json['ipReservations'] == null
      ? null
      : IpReservations.fromJson(json['ipReservations'] as Map<String, dynamic>),
  latestFirmware: json['latestFirmware'] as String?,
  latestFirmwareDate: (json['latestFirmwareDate'] as num?)?.toInt(),
  latestFirmwareUri: json['latestFirmwareUri'] as String?,
  macAddress: json['macAddress'] as String?,
  name: json['name'] as String?,
  newFirmwareAvailable: json['newFirmwareAvailable'] as bool?,
  radios: (json['radios'] as List<dynamic>?)
      ?.map((e) => Radio.fromJson(e as Map<String, dynamic>))
      .toList(),
  serialNumber: json['serialNumber'] as String?,
  subscriberDevices: json['subscriberDevices'] == null
      ? null
      : SubscriberDevices.fromJson(
          json['subscriberDevices'] as Map<String, dynamic>,
        ),
  wifiNetworks: json['wifiNetworks'] == null
      ? null
      : WifiNetworks.fromJson(json['wifiNetworks'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AccessPointToJson(AccessPoint instance) =>
    <String, dynamic>{
      'address': instance.address,
      'automaticUpgrade': instance.automaticUpgrade,
      'configurationUuid': instance.configurationUuid,
      'currentFirmware': instance.currentFirmware,
      'currentFirmwareDate': instance.currentFirmwareDate,
      'deviceMode': instance.deviceMode,
      'deviceType': instance.deviceType,
      'dnsConfiguration': instance.dnsConfiguration,
      'id': instance.id,
      'internetConnection': instance.internetConnection,
      'ipReservations': instance.ipReservations,
      'latestFirmware': instance.latestFirmware,
      'latestFirmwareDate': instance.latestFirmwareDate,
      'latestFirmwareUri': instance.latestFirmwareUri,
      'macAddress': instance.macAddress,
      'name': instance.name,
      'newFirmwareAvailable': instance.newFirmwareAvailable,
      'radios': instance.radios,
      'serialNumber': instance.serialNumber,
      'subscriberDevices': instance.subscriberDevices,
      'wifiNetworks': instance.wifiNetworks,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  addressLines: json['addressLines'] as List<dynamic>?,
  buildingName: json['buildingName'],
  city: json['city'],
  country: json['country'],
  mobiles: json['mobiles'] as List<dynamic>?,
  phones: json['phones'] as List<dynamic>?,
  postal: json['postal'],
  state: json['state'],
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'addressLines': instance.addressLines,
  'buildingName': instance.buildingName,
  'city': instance.city,
  'country': instance.country,
  'mobiles': instance.mobiles,
  'phones': instance.phones,
  'postal': instance.postal,
  'state': instance.state,
};

DeviceMode _$DeviceModeFromJson(Map<String, dynamic> json) => DeviceMode(
  created: (json['created'] as num?)?.toInt(),
  enableLeds: json['enableLeds'] as bool?,
  endIp: json['endIp'] as String?,
  endIpv6: json['endIpv6'],
  modified: (json['modified'] as num?)?.toInt(),
  startIp: json['startIp'] as String?,
  startIpv6: json['startIpv6'],
  subnet: json['subnet'] as String?,
  subnetMask: json['subnetMask'] as String?,
  subnetMaskV6: (json['subnetMaskV6'] as num?)?.toInt(),
  subnetV6: json['subnetV6'],
  type: json['type'] as String?,
);

Map<String, dynamic> _$DeviceModeToJson(DeviceMode instance) =>
    <String, dynamic>{
      'created': instance.created,
      'enableLeds': instance.enableLeds,
      'endIp': instance.endIp,
      'endIpv6': instance.endIpv6,
      'modified': instance.modified,
      'startIp': instance.startIp,
      'startIpv6': instance.startIpv6,
      'subnet': instance.subnet,
      'subnetMask': instance.subnetMask,
      'subnetMaskV6': instance.subnetMaskV6,
      'subnetV6': instance.subnetV6,
      'type': instance.type,
    };

DnsConfiguration _$DnsConfigurationFromJson(Map<String, dynamic> json) =>
    DnsConfiguration(
      isp: json['isp'] as bool?,
      custom: json['custom'] as bool?,
      primary: json['primary'],
      primaryV6: json['primaryV6'],
      secondary: json['secondary'],
      secondaryV6: json['secondaryV6'] as String?,
    );

Map<String, dynamic> _$DnsConfigurationToJson(DnsConfiguration instance) =>
    <String, dynamic>{
      'isp': instance.isp,
      'custom': instance.custom,
      'primary': instance.primary,
      'primaryV6': instance.primaryV6,
      'secondary': instance.secondary,
      'secondaryV6': instance.secondaryV6,
    };

InternetConnection _$InternetConnectionFromJson(Map<String, dynamic> json) =>
    InternetConnection(
      created: (json['created'] as num?)?.toInt(),
      defaultGateway: json['defaultGateway'] as String?,
      defaultGatewayV6: json['defaultGatewayV6'],
      ipAddress: json['ipAddress'] as String?,
      ipAddressV6: json['ipAddressV6'],
      ipV6Support: json['ipV6Support'] as bool?,
      modified: (json['modified'] as num?)?.toInt(),
      password: json['password'],
      primaryDns: json['primaryDns'] as String?,
      primaryDnsV6: json['primaryDnsV6'],
      secondaryDns: json['secondaryDns'] as String?,
      secondaryDnsV6: json['secondaryDnsV6'],
      sendHostname: json['sendHostname'] as bool?,
      subnetMask: json['subnetMask'] as String?,
      subnetMaskV6: (json['subnetMaskV6'] as num?)?.toInt(),
      type: json['type'] as String?,
      username: json['username'],
    );

Map<String, dynamic> _$InternetConnectionToJson(InternetConnection instance) =>
    <String, dynamic>{
      'created': instance.created,
      'defaultGateway': instance.defaultGateway,
      'defaultGatewayV6': instance.defaultGatewayV6,
      'ipAddress': instance.ipAddress,
      'ipAddressV6': instance.ipAddressV6,
      'ipV6Support': instance.ipV6Support,
      'modified': instance.modified,
      'password': instance.password,
      'primaryDns': instance.primaryDns,
      'primaryDnsV6': instance.primaryDnsV6,
      'secondaryDns': instance.secondaryDns,
      'secondaryDnsV6': instance.secondaryDnsV6,
      'sendHostname': instance.sendHostname,
      'subnetMask': instance.subnetMask,
      'subnetMaskV6': instance.subnetMaskV6,
      'type': instance.type,
      'username': instance.username,
    };

IpReservations _$IpReservationsFromJson(Map<String, dynamic> json) =>
    IpReservations(
      created: (json['created'] as num?)?.toInt(),
      id: json['id'],
      modified: (json['modified'] as num?)?.toInt(),
      reservations: json['reservations'] as List<dynamic>?,
    );

Map<String, dynamic> _$IpReservationsToJson(IpReservations instance) =>
    <String, dynamic>{
      'created': instance.created,
      'id': instance.id,
      'modified': instance.modified,
      'reservations': instance.reservations,
    };

Radio _$RadioFromJson(Map<String, dynamic> json) => Radio(
  allowDfs: json['allowDfs'] as bool?,
  band: json['band'] as String?,
  bandwidth: (json['bandwidth'] as num?)?.toInt(),
  beaconInterval: (json['beaconInterval'] as num?)?.toInt(),
  channel: (json['channel'] as num?)?.toInt(),
  channelMode: json['channelMode'] as String?,
  channelWidth: (json['channelWidth'] as num?)?.toInt(),
  country: json['country'] as String?,
  dtimPeriod: (json['dtimPeriod'] as num?)?.toInt(),
  he: json['he'] == null
      ? null
      : He.fromJson(json['he'] as Map<String, dynamic>),
  legacyRates: json['legacyRates'] as bool?,
  maximumClients: (json['maximumClients'] as num?)?.toInt(),
  mimo: json['mimo'],
  rates: json['rates'] == null
      ? null
      : Rates.fromJson(json['rates'] as Map<String, dynamic>),
  rawInfo: json['rawInfo'] as List<dynamic>?,
  requireMode: json['requireMode'],
  txpower: (json['txpower'] as num?)?.toInt(),
);

Map<String, dynamic> _$RadioToJson(Radio instance) => <String, dynamic>{
  'allowDfs': instance.allowDfs,
  'band': instance.band,
  'bandwidth': instance.bandwidth,
  'beaconInterval': instance.beaconInterval,
  'channel': instance.channel,
  'channelMode': instance.channelMode,
  'channelWidth': instance.channelWidth,
  'country': instance.country,
  'dtimPeriod': instance.dtimPeriod,
  'he': instance.he,
  'legacyRates': instance.legacyRates,
  'maximumClients': instance.maximumClients,
  'mimo': instance.mimo,
  'rates': instance.rates,
  'rawInfo': instance.rawInfo,
  'requireMode': instance.requireMode,
  'txpower': instance.txpower,
};

He _$HeFromJson(Map<String, dynamic> json) => He(
  bssColor: (json['bssColor'] as num?)?.toInt(),
  ema: json['ema'] as bool?,
  multipleBssid: json['multipleBssid'] as bool?,
);

Map<String, dynamic> _$HeToJson(He instance) => <String, dynamic>{
  'bssColor': instance.bssColor,
  'ema': instance.ema,
  'multipleBssid': instance.multipleBssid,
};

Rates _$RatesFromJson(Map<String, dynamic> json) => Rates(
  beacon: (json['beacon'] as num?)?.toInt(),
  multicast: (json['multicast'] as num?)?.toInt(),
);

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
  'beacon': instance.beacon,
  'multicast': instance.multicast,
};

SubscriberDevices _$SubscriberDevicesFromJson(Map<String, dynamic> json) =>
    SubscriberDevices(
      created: (json['created'] as num?)?.toInt(),
      devices: json['devices'] as List<dynamic>?,
      modified: (json['modified'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubscriberDevicesToJson(SubscriberDevices instance) =>
    <String, dynamic>{
      'created': instance.created,
      'devices': instance.devices,
      'modified': instance.modified,
    };

WifiNetworks _$WifiNetworksFromJson(Map<String, dynamic> json) => WifiNetworks(
  created: (json['created'] as num?)?.toInt(),
  modified: (json['modified'] as num?)?.toInt(),
  wifiNetworks: (json['wifiNetworks'] as List<dynamic>?)
      ?.map((e) => WifiNetwork.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WifiNetworksToJson(WifiNetworks instance) =>
    <String, dynamic>{
      'created': instance.created,
      'modified': instance.modified,
      'wifiNetworks': instance.wifiNetworks,
    };

WifiNetwork _$WifiNetworkFromJson(Map<String, dynamic> json) => WifiNetwork(
  bands: (json['bands'] as List<dynamic>?)?.map((e) => e as String).toList(),
  encryption: json['encryption'] as String?,
  name: json['name'] as String?,
  password: json['password'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$WifiNetworkToJson(WifiNetwork instance) =>
    <String, dynamic>{
      'bands': instance.bands,
      'encryption': instance.encryption,
      'name': instance.name,
      'password': instance.password,
      'type': instance.type,
    };
