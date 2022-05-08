import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';        

import 'package:ttt/ttt/ttt_cubit.dart';
import 'package:ttt/ttt/ttt_model.dart';

class TicTacToeView extends StatelessWidget {
  const TicTacToeView({Key? key}): super(key: key);

  Widget square(i) =>
    Builder(builder: (context) {
      final player = context.select((TicTacToeCubit cubit) =>
        cubit.state.square(i));
      return
        player == Player.x ? CustomPaint(painter: XPainter(), child: Container()) :
        player == Player.o ? CustomPaint(painter: OPainter(), child: Container()) :
        GestureDetector(onTap: () =>
          context.read<TicTacToeCubit>().move(i));
      });

  @override
  Widget build(BuildContext context) {
    int cindex = 0;

    return 
      Stack(children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: CustomPaint(painter: BoardPainter()))),
        Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Column(children: List<Widget>.generate(7, (i) => i % 2 == 0
              ? Expanded(flex: 1, child: Container())
              : Expanded(
                flex: 10,
                child: Row(children: List<Widget>.generate(7, (j) => j % 2 == 0
                  ? Expanded(flex: 1, child: Container())
                  : Expanded(
                    flex: 10,
                    child: square(cindex++),
                  ))))))))]);
  }
}

class XPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final green = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.lightGreenAccent.shade700;
    final wd = size.width  / 10;
    final ht = size.height / 10;
    slash(q, ax, ay, bx, by) {
      const k = 0.70710678118;
      final path = Path();
      path.moveTo(wd * (ax - k * q),  ay      * ht);
      path.lineTo(wd *  ax,          (ay - k) * ht);
      path.lineTo(wd * (bx + k * q),  by      * ht);
      path.lineTo(wd *  bx,          (by + k) * ht);
      canvas.drawPath(path, green);
    }
    slash( 1, 1.5, 1.5, 8.5, 8.5);
    slash(-1, 8.5, 1.5, 1.5, 8.5);
  }
  @override
  bool shouldRepaint(XPainter oldDelegate) => false;
}

class OPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final purple = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.purpleAccent.shade700;
    final white = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white; // TODO: theme background
    final wd = size.width  / 10;
    final ht = size.height / 10;
    oval(i, j, p) => canvas.drawOval(
        Rect.fromLTWH(i * wd, i * ht, j * wd, j * ht),
        p);
    oval(1, 8, purple);
    oval(2, 6, white);
  }
  @override
  bool shouldRepaint(OPainter oldDelegate) => false;
}

class BoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final indigo = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.indigo;
    final wd = size.width  / 34;
    final ht = size.height / 34;
    hline(i) => canvas.drawRect(
        Rect.fromLTWH(wd, i * ht, size.width - 2 * wd, ht), indigo);
    vline(i) => canvas.drawRect(
        Rect.fromLTWH(i * wd, ht, wd, size.height - 2 * ht), indigo);
    hline(11);
    vline(11);
    hline(22);
    vline(22);
  }
  @override
  bool shouldRepaint(BoardPainter oldDelegate) => false;
}
