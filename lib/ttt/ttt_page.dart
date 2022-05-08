import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:ttt/ttt/ttt_cubit.dart';
import 'package:ttt/ttt/ttt_view.dart';

class TicTacToePage extends StatelessWidget {
  const TicTacToePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const TicTacToeView();
    // TODO: See comments in ttt_app.dart.
    //
    // return BlocProvider(
    //   create: (_) => TicTacToeCubit(),
    //   child: const TicTacToeView(),
    // );
  }
}
