/// This class is used in the [GroupSelectionScreen] screen for group items.
class GroupItemModel {
  String? id;
  String? name;
  String? deviceCount;
  bool? isSelected;

  GroupItemModel({
    this.id,
    this.name,
    this.deviceCount,
    this.isSelected,
  }) {
    id = id ?? '';
    name = name ?? '';
    deviceCount = deviceCount ?? '';
    isSelected = isSelected ?? false;
  }

  GroupItemModel copyWith({
    String? id,
    String? name,
    String? deviceCount,
    bool? isSelected,
  }) {
    return GroupItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      deviceCount: deviceCount ?? this.deviceCount,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
