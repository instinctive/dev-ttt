import 'package:test/test.dart';

import 'package:ttt/ttt/ttt_model.dart';

void main() {
  final init = TicTacToe.init;
  test('Initial game state', () {
    final ttt = init;
    expect(ttt.status, equals(Status.move));
    expect(ttt.player, equals(Player.x));
    for (int i=0; i<9; i++) {
      expect(ttt.square(i), equals(Player.none));
    }
  });
  test('Move 4', () {
    final ttt = init.move(4);
    expect(ttt.status, equals(Status.move));
    expect(ttt.player, equals(Player.o));
    for (int i=0; i<9; i++) {
      if (i==4) {
        expect(ttt.square(i), equals(Player.x));
      } else {
        expect(ttt.square(i), equals(Player.none));
      }
    }
  });
  test('Move 42018', () {
    final ttt = init.move(4).move(2).move(0).move(1).move(8);
    expect(ttt.status, equals(Status.win));
    expect(ttt.player, equals(Player.x));
  });
  test('Move 420183', () {
    expect(
      () => init.move(4).move(2).move(0).move(1).move(8).move(3),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove at 3: game is over.'
        )));
  });
  test('Move 9', () {
    expect(
      () => TicTacToe.init.move(9),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove at 9: out of bounds.'
        )));
  });
  test('Move 44', () {
    expect(
      () => TicTacToe.init.move(4).move(4),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove at 4: square is taken.'
        )));
  });
}
