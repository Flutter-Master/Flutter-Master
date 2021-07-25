import 'dart:async';

/// This class will contain all the
/// business login for [HomeScreen]
class HomeModel {
  //private streamController
  StreamController<int> _streamController = StreamController<int>();

  /// Get stream of integers
  Stream<int> get integerStream => _streamController.stream;

  //keeping track of the counter
  int _counter = 0;

  /// Will increment the counter and
  /// add it to the stream
  void incrementCounter() {
    _counter++;
    _streamController.add(_counter);
  }

  /// Will decrement the counter and
  /// add it to the stream
  void decrementCounter() {
    _counter--;
    _streamController.add(_counter);
  }

  /// Will close the StreamController
  void close() {
    _streamController.close();
  }
}
