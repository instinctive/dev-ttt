enum Player { none, x, o }
enum Status { move, win, tie }

Player _opp(Player a) =>
  a == Player.none ? Player.none :
  a == Player.x ? Player.o : Player.x;

bool _isWin(Player w, List<Player> bd, List<int> ii) {
  for (var i in ii) {
    if (bd[i] != w) return false;
  }
  return true;
}

Status _status(Player w, List<Player> bd) {
  if (_isWin(w,bd,[0,1,2]) ||
      _isWin(w,bd,[3,4,5]) ||
      _isWin(w,bd,[6,7,8]) ||
      _isWin(w,bd,[0,3,6]) ||
      _isWin(w,bd,[1,4,7]) ||
      _isWin(w,bd,[2,5,8]) ||
      _isWin(w,bd,[0,4,8]) ||
      _isWin(w,bd,[2,4,6])) {
    return Status.win;
  }
  for (int i=0; i<9; i++) {
    if (bd[i] == Player.none) return Status.move;
  }
  return Status.tie;
}

class InvalidMove implements Exception {
  final int _pos;
  final String _err;
  InvalidMove(this._pos, this._err);

  @override
  toString() => 'InvalidMove at $_pos: $_err.';
}

/// A game of Tic-Tac-Toe.
/// The squares of the board are indexed from 0-8:
///
///     +---+---+---+
///     | 0 | 1 | 2 |
///     +---+---+---+
///     | 3 | 4 | 5 |
///     +---+---+---+
///     | 6 | 7 | 8 |
///     +---+---+---+
///
class TicTacToe {
  final Status _st;
  final Player _player;
  final List<Player> _board;
  const TicTacToe._(this._st, this._player, this._board);

  /// The initial state of the game.
  static final TicTacToe init = TicTacToe._(
      Status.move,
      Player.x,
      List<Player>.filled(9,Player.none)
  );
  Status get status => _st;
  Player get player => _player;
  Player square(int i) => _board[i];

  /// Play a move by the current player at this square.
  TicTacToe move(int i) {
    if (_st != Status.move)       throw InvalidMove(i, 'game is over');
    if (i < 0 || i > 8)           throw InvalidMove(i, 'out of bounds');
    if (square(i) != Player.none) throw InvalidMove(i, 'square is taken');
    var board = [..._board]..replaceRange(i,i+1,[_player]);
    Status st = _status(_player, board);
    return TicTacToe._(
        st,
        st == Status.tie ? Player.none :
        st == Status.win ? _player : _opp(_player),
        board);
  }

  @override
  String toString() =>
    'TicTacToe(${_st.name}, '
    '${_player.name}, '
    '${_board.map((p) => p == Player.none ? '_' : p.name).join()})';
}
