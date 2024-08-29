class Counter {
  int _counter = 0;
  int get counter => _counter;

  void increamentCounter() {
    _counter++;
  }

  void reset() {
    _counter = 0;
  }
}
