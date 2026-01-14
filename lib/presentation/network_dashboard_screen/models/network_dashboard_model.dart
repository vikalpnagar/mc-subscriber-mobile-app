/// This class is used in the [NetworkDashboardScreen] screen.

// ignore_for_file: must_be_immutable
class NetworkDashboardModel {
  NetworkDashboardModel({this.selectedTabIndex}) {
    selectedTabIndex = selectedTabIndex ?? 0;
  }

  int? selectedTabIndex;
}
