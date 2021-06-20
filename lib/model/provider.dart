import 'package:flutter/cupertino.dart';

class MyCounter extends ChangeNotifier {
  int _xounter = 0;

  getCounter() => _xounter;
  // setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _xounter++;

    notifyListeners();
  }

  void decrementCounter() {
    if (_xounter <= 0) {
      _xounter = 0;
    } else {
      _xounter--;
    }
    notifyListeners();
  }

  void reset() {
    _xounter = 0;
    notifyListeners();
  }
}
