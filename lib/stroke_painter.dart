import 'package:flutter/material.dart';
import 'models/stroke.dart';

class StrokePainter extends CustomPainter {
  final Stroke stroke;
  final StrokeCap strokeCap;

  StrokePainter({@required this.stroke, @required this.strokeCap});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color.fromARGB(
        255, stroke.color.red, stroke.color.green, stroke.color.blue);
    paint.strokeCap = strokeCap;
    paint.strokeWidth = stroke.strokeWidth;
    for (var i = 0; i < stroke.locations.length - 1; i++) {
      final from = stroke.locations[i];
      final to = stroke.locations[i + 1];
      canvas.drawLine(Offset(from.x, from.y), Offset(to.x, to.y), paint);
    }
  }

  @override
  bool shouldRepaint(StrokePainter oldPainter) => stroke != oldPainter.stroke;
}
