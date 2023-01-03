import 'package:flutter/widgets.dart';

abstract class StateManager<State extends Object?> {
  late State _state;

  bool _emitted = false;

  @override
  State get state => _state;

  void onChange() {}
}
