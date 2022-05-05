import 'package:test/test.dart';

import 'package:ttt/model/model.dart';

void main() {
  var ttt = TTT.init;
  test('Initial game state', () {
    expect(ttt.status, equals(Status.move));
    expect(ttt.player, equals(Player.x));
    for (int i=0; i<9; i++) {
      expect(ttt.square(i), equals(Player.none));
    }
  });
  test('Move 4', () {
    var ttt = TTT.init.move(4);
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
    var ttt = TTT.init.move(4).move(2).move(0).move(1).move(8);
    expect(ttt.status, equals(Status.win));
    expect(ttt.player, equals(Player.x));
  });
  test('Move 420183', () {
    expect(
      () => TTT.init.move(4).move(2).move(0).move(1).move(8).move(3),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove at 3: game is over.'
        )));
  });
  test('Move 9', () {
    expect(
      () => TTT.init.move(9),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove at 9: out of bounds.'
        )));
  });
  test('Move 44', () {
    expect(
      () => TTT.init.move(4).move(4),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove at 4: square is taken.'
        )));
  });
}
