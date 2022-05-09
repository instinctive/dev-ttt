import 'package:bloc/bloc.dart';

import 'package:ttt/ttt/ttt_model.dart';

class TicTacToeCubit extends Cubit<TicTacToe> {
  TicTacToeCubit(): super (TicTacToe.init);
  void init() => emit(TicTacToe.init);
  void move(int i) {
    try {
      emit(state.move(i));
    } on InvalidMove catch (e) {
      print(e);
    }
  }
}
