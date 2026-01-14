/// This class is used in the [edit_network_screen] screen.

// ignore_for_file: must_be_immutable
class EditNetworkModel {
  EditNetworkModel({
    this.networkName,
    this.password,
    this.isPasswordVisible,
    this.id,
  }) {
    networkName = networkName ?? '';
    password = password ?? '';
    isPasswordVisible = isPasswordVisible ?? false;
    id = id ?? '';
  }

  String? networkName;
  String? password;
  bool? isPasswordVisible;
  String? id;

  EditNetworkModel copyWith({
    String? networkName,
    String? password,
    bool? isPasswordVisible,
    String? id,
  }) {
    return EditNetworkModel(
      networkName: networkName ?? this.networkName,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      id: id ?? this.id,
    );
  }
}
