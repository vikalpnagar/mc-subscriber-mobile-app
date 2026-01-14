import 'package:family_wifi/core/utils/alert_state_provider.dart';
import 'package:family_wifi/core/utils/loading_state_provider.dart';
import 'package:family_wifi/core/utils/print_log_helper.dart';

mixin BaseBloc {
  late final LoadingStateProvider loadingStateProvider;
  late final AlertStateProvider alertStateProvider;

  void initialize(
    LoadingStateProvider loadingStateProvider,
    AlertStateProvider alertStateProvider,
  ) {
    this.loadingStateProvider = loadingStateProvider;
    this.alertStateProvider = alertStateProvider;
  }

  void startLoading({String? title, String? message}) {
    logPrint('baseBloc: startLoading');
    loadingStateProvider.startLoading(title: title, message: message);
  }

  void dismissLoading() {
    logPrint('baseBloc: dismissLoading');
    loadingStateProvider.dismissLoading();
  }

  bool get isLoading => loadingStateProvider.loading;

  void showAlert(
    String title,
    String message, {
    String? yesAction,
    String? noAction,
    Function? yesHandler,
    Function? noHandler,
  }) {
    logPrint('baseBloc: showAlert');
    alertStateProvider.showAlert(title, message);
  }

  void dismissAlert() {
    logPrint('baseBloc: dismissAlert');
    alertStateProvider.dismissAlert();
  }

  bool get isAlertDisplaying => alertStateProvider.display;

  void dispose() {
    loadingStateProvider.dispose();
    alertStateProvider.dispose();
  }
}
