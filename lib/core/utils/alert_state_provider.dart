import 'package:flutter/material.dart';

class AlertStateProvider extends ChangeNotifier {
  bool display = false;
  String? title;
  String? message;
  String? yesAction;
  String? noAction;
  Function? yesHandler;
  Function? noHandler;

  AlertStateProvider(
    this.display, {
    this.title,
    this.message,
    this.yesAction,
    this.yesHandler,
    this.noAction,
    this.noHandler,
  });

  String get alertMsg => this.message ?? 'NO MESSAGE';

  String get yesMsg => this.yesAction ?? 'OK';

  showAlert(
    String message, {
    String? title,
    String? yesAction,
    String? noAction,
    Function? yesHandler,
    Function? noHandler,
  }) {
    this.display = true;
    this.message = message;
    this.title = title;
    this.yesAction = yesAction;
    this.noAction = noAction;
    this.yesHandler = yesHandler;
    this.noHandler = noHandler;
    notifyListeners();
  }

  dismissAlert() {
    this.display = false;
    this.message = null;
    this.title = null;
    this.yesAction = null;
    this.noAction = null;
    this.yesHandler = null;
    this.noHandler = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
