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

  String get yesMsg => this.yesAction ?? 'Ok';

  showAlert(
    String title,
    String message, {
    String? yesAction,
    String? noAction,
    Function? yesHandler,
    Function? noHandler,
  }) {
    this.display = true;
    this.title = title;
    this.message = message;
    this.yesAction = yesAction;
    this.noAction = noAction;
    this.yesHandler = yesHandler;
    this.noHandler = noHandler;
    notifyListeners();
  }

  dismissAlert() {
    this.display = false;
    this.title = null;
    this.message = null;
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
