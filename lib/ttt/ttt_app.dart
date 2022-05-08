import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ttt/ttt/ttt_cubit.dart';
import 'package:ttt/ttt/ttt_page.dart';

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: This is here for the "restart" button, but perhaps this is an
    // anti-pattern, and there should be a different cubit that in turn
    // accesses the ttt_cubit? See commented code in ttt_page.dart.
    return BlocProvider(
      create: (_) => TicTacToeCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Tic-Tac-Toe'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.restart_alt_sharp),
                  tooltip: 'Restart',
                  onPressed: () => context.read<TicTacToeCubit>().init(),
                )
              ],
            ),
            body: const TicTacToePage(),
          ),
        ),
      ),
    );
  }
}

