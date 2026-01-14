class SignUpResult {
  final String id;
  final String macAddress;
  final String deviceID;
  final String userId;
  final String registrationId;
  final String status;

  SignUpResult({
    required this.id,
    required this.macAddress,
    required this.deviceID,
    required this.userId,
    required this.registrationId,
    required this.status,
  });

  factory SignUpResult.fromJson(Map<String, dynamic> json) {
    return SignUpResult(
      id: json['id'],
      macAddress: json['macAddress'],
      deviceID: json['deviceID'],
      userId: json['userId'],
      registrationId: json['registrationId'],
      status: json['status'],
    );
  }
}
