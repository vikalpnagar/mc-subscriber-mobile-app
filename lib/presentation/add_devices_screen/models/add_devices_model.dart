/// This class is used in the [AddDevicesScreen] screen.

// ignore_for_file: must_be_immutable
class AddDevicesModel {
  AddDevicesModel({
    this.id,
    this.name,
    this.model,
    this.icon,
    this.isSelected,
  }) {
    id = id ?? '';
    name = name ?? '';
    model = model ?? '';
    icon = icon ?? 'assets/images/img_depth_4_frame_0_1.svg';
    isSelected = isSelected ?? false;
  }

  String? id;
  String? name;
  String? model;
  String? icon;
  bool? isSelected;

  AddDevicesModel copyWith({
    String? id,
    String? name,
    String? model,
    String? icon,
    bool? isSelected,
  }) {
    return AddDevicesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      model: model ?? this.model,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
