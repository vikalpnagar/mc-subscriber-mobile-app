/// This class is used in the [EditGuestNetworkScreen] screen.

// ignore_for_file: must_be_immutable
class EditGuestNetworkModel {
  EditGuestNetworkModel({
    this.isGuestNetworkEnabled,
    this.networkName,
    this.password,
  }) {
    isGuestNetworkEnabled = isGuestNetworkEnabled ?? false;
    networkName = networkName ?? '';
    password = password ?? '';
  }

  bool? isGuestNetworkEnabled;
  String? networkName;
  String? password;

  EditGuestNetworkModel copyWith({
    bool? isGuestNetworkEnabled,
    String? networkName,
    String? password,
  }) {
    return EditGuestNetworkModel(
      isGuestNetworkEnabled:
          isGuestNetworkEnabled ?? this.isGuestNetworkEnabled,
      networkName: networkName ?? this.networkName,
      password: password ?? this.password,
    );
  }
}
