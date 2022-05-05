import 'package:flutter/material.dart';

class TicTacToeUI extends StatelessWidget {
  const TicTacToeUI({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: CustomPaint(
          painter: BoardPainter(),
        ),
      ),
    );
  }
}

class BoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final indigo = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.indigo;
    final green = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.lightGreenAccent.shade700;
    final purple = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.purpleAccent.shade700;
    final white = Paint()
        ..style = PaintingStyle.fill
        ..color = Colors.white; // TODO: theme background
    final ht = size.height / 34;
    final wd = size.width  / 34;
    hline(i) => canvas.drawRect(Rect.fromLTWH(wd,i*ht,size.width-2*wd,ht), indigo);
    vline(i) => canvas.drawRect(Rect.fromLTWH(i*wd,ht,wd,size.height-2*ht), indigo);
    oval(i,j,p) => canvas.drawOval(Rect.fromLTWH(i*wd,i*ht,j*wd,j*ht), p);
    slash(q,ax,ay,bx,by) {
      const k = 0.70710678118;
      final path = Path();
      path.moveTo(wd*(ax-k*q),ay*ht);
      path.lineTo(wd*ax,(ay-k)*ht);
      path.lineTo(wd*(bx+k*q),by*ht);
      path.lineTo(wd*bx,(by+k)*ht);
      canvas.drawPath(path,green);
    }
    hline(11);
    vline(11);
    hline(22);
    vline(22);
    oval(2,8,purple);
    oval(3,6,white);
    slash( 1,13.5,13.5,20.5,20.5);
    slash(-1,20.5,13.5,13.5,20.5);
  }
  @override
  bool shouldRepaint(BoardPainter oldDelegate) => false;
}
