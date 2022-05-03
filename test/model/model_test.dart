import 'package:test/test.dart';

import 'package:ttt/model/model.dart';

void main() {
  var ttt = TTT.init;
  test('Initial game state', () {
    expect(ttt.isOver, equals(false));
    expect(ttt.player, equals(Sq.X));
    expect(ttt.winner, equals(Sq.Z));
    for (int i=0; i<9; i++) {
      expect(ttt.square(i), equals(Sq.Z));
    }
  });
  test('Move 4', () {
    var ttt = TTT.init.move(4);
    expect(ttt.isOver, equals(false));
    expect(ttt.player, equals(Sq.O));
    expect(ttt.winner, equals(Sq.Z));
    for (int i=0; i<9; i++) {
      if (i==4) {
        expect(ttt.square(i), equals(Sq.X));
      } else {
        expect(ttt.square(i), equals(Sq.Z));
      }
    }
  });
  test('Move 42018', () {
    var ttt = TTT.init.move(4).move(2).move(0).move(1).move(8);
    expect(ttt.isOver, equals(true));
    expect(ttt.player, equals(Sq.Z));
    expect(ttt.winner, equals(Sq.X));
  });
  test('Move 44', () {
    expect(
      () => TTT.init.move(4).move(4),
      throwsA(isA<InvalidMove>().having(
        (e) => e.toString(), 'toString()',
        'InvalidMove: Sq.O attempted to play at 4.'
        )));
  });
}
