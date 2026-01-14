class AddFamilyWiFiGroupModel {
  String? groupName;
  String? id;

  AddFamilyWiFiGroupModel({
    this.groupName,
    this.id,
  }) {
    groupName = groupName ?? '';
    id = id ?? '';
  }

  AddFamilyWiFiGroupModel copyWith({
    String? groupName,
    String? id,
  }) {
    return AddFamilyWiFiGroupModel(
      groupName: groupName ?? this.groupName,
      id: id ?? this.id,
    );
  }
}
