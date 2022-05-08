import 'package:bloc/bloc.dart';

class TicTacToeObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print(
      '${change.currentState.toString()} => '
      '${change.nextState.toString()}');
    super.onChange(bloc, change);
  }
}

