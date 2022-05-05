import 'package:flutter/material.dart';

// import 'package:ttt/model/model.dart';
import 'package:ttt/ttt/ttt_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tic-Tac-Toe (ui visual only)'),
        ),
        body: const TicTacToeView(),
      ),
    );
  }
}
