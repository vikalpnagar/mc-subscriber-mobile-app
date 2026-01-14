class NetworkHealthModel {
  String? title;
  bool? isOverviewTabSelected;
  bool? isHealthTabSelected;

  NetworkHealthModel({
    this.title,
    this.isOverviewTabSelected,
    this.isHealthTabSelected,
  }) {
    title = title ?? 'Home';
    isOverviewTabSelected = isOverviewTabSelected ?? false;
    isHealthTabSelected = isHealthTabSelected ?? true;
  }
}
