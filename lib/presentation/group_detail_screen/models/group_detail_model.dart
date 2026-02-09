class GroupDetailModel {
  String? groupName;
  String? id;

  GroupDetailModel({
    this.groupName,
    this.id,
  }) {
    groupName = groupName ?? '';
    id = id ?? '';
  }
}
