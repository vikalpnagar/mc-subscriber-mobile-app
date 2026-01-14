/// This class is used in the [GroupSelectionScreen] screen.
class GroupSelectionModel {
  String? title;
  List<String>? selectedGroupIds;

  GroupSelectionModel({
    this.title,
    this.selectedGroupIds,
  }) {
    title = title ?? 'Link to Groups';
    selectedGroupIds = selectedGroupIds ?? [];
  }
}
