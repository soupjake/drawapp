import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  List<Offset> points;
  Color color;
  StrokeCap strokeCap;
  double strokeWidth;
  List<Painter> painters;

  Painter(
      {this.points,
      this.color,
      this.strokeCap,
      this.strokeWidth,
      this.painters = const []});

  @override
  void paint(Canvas canvas, Size size) {
    for (final painter in painters) {
      painter.paint(canvas, size);
    }

    final paint = Paint();
    paint.color = color;
    paint.strokeCap = strokeCap;
    paint.strokeWidth = strokeWidth;
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Painter oldPainter) => true;
}
