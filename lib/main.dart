import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:ttt/ttt/ttt_app.dart';
import 'package:ttt/main_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const TicTacToeApp()),
    blocObserver: MainObserver(),
  );
}
