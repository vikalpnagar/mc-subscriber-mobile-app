import 'package:flutter/material.dart';

class LoadingStateProvider extends ChangeNotifier {
  bool loading;
  String? title;
  String? message;

  LoadingStateProvider(this.loading, {this.title, this.message});

  startLoading({String? title, String? message}) {
    this.loading = true;
    this.title = title;
    this.message = message;
    notifyListeners();
  }

  dismissLoading() {
    this.loading = false;
    this.title = null;
    this.message = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
