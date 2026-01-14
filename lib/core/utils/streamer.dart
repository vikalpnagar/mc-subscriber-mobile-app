import 'dart:async';

class Streamer<T> {
  T? _data;
  StreamController<T?> _controller = StreamController.broadcast();
  Stream<T?> get stream => _controller.stream;
  Stream<T> get streamNonNull => _controller.stream.cast<T>();

  Streamer({T? initialValue}) {
    this._data = initialValue;
    if (this._data != null) {
      _notifyListeners();
    }
  }

  T get value => this._data!;

  T? get valueOrNull => this._data;

  bool get hasValue => this._data != null;

  set value(T? newValue) {
    this._data = newValue;
    _notifyListeners();
  }

  void _notifyListeners() {
    _controller.sink.add(_data);
  }

  void close() {
    _controller.close();
  }
}
