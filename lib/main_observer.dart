import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class MainObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint(
      '${change.currentState.toString()} => '
      '${change.nextState.toString()}');
    super.onChange(bloc, change);
  }
}

