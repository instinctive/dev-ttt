enum Sq { Z, X, O }
enum St { Invalid, Move, Win, Tie }

Sq _opp(Sq a) =>
  a == Sq.Z ? Sq.Z :
  a == Sq.X ? Sq.O : Sq.X;

bool _isWin(Sq w, List<Sq> bd, List<int> ii) {
  for (var i in ii) {
    if (bd[i] != w) return false;
  }
  return true;
}

St _status(Sq w, List<Sq> bd) {
  if (_isWin(w,bd,[0,1,2]) ||
      _isWin(w,bd,[3,4,5]) ||
      _isWin(w,bd,[6,7,8]) ||
      _isWin(w,bd,[0,3,6]) ||
      _isWin(w,bd,[1,4,7]) ||
      _isWin(w,bd,[2,5,8]) ||
      _isWin(w,bd,[0,4,8]) ||
      _isWin(w,bd,[2,4,6])) {
    return St.Win;
  }
  for (int i=0; i<9; i++) {
    if (bd[i] == Sq.Z) return St.Move;
  }
  return St.Tie;
}

class TTT {
  static final TTT init = TTT._(St.Move, Sq.X, Sq.Z, List<Sq>.filled(9,Sq.Z));
  bool get isValid => _st != St.Invalid;
  bool get isOver => _st != St.Move;
  Sq get player => _player;
  Sq get winner => _winner;
  Sq square(int i) => _board[i];

  final St _st;
  final Sq _player;
  final Sq _winner;
  final List<Sq> _board;
  TTT._(this._st, this._player, this._winner, this._board);

  TTT move(int i) {
    if (isOver || i < 0 || i > 8 || square(i) != Sq.Z) {
      return TTT._(St.Invalid, Sq.Z, Sq.Z, _board);
    } else {
      var board = [..._board]..replaceRange(i,i+1,[_player]);
      St st = _status(_player, board);
      return TTT._(
          st,
          st != St.Move ? Sq.Z : _opp(_player),
          st != St.Win  ? Sq.Z : _player,
          board);
    }
  }
}
