/// This class is used in the [network_welcome_screen] screen.

// ignore_for_file: must_be_immutable
class NetworkWelcomeModel {
  NetworkWelcomeModel({this.id}) {
    id = id ?? '';
  }

  String? id;
}
