import 'package:drawapp/color_dialog.dart';
import 'package:drawapp/painter.dart';
import 'package:drawapp/width_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrawPage extends StatefulWidget {
  @override
  DrawPageState createState() => new DrawPageState();
}

class DrawPageState extends State<DrawPage> with TickerProviderStateMixin {
  AnimationController controller;
  bool fabExpanded = false;
  List<Offset> points = <Offset>[];
  Color color = Colors.black;
  StrokeCap strokeCap = StrokeCap.round;
  double strokeWidth = 5.0;
  List<Painter> painters = <Painter>[];

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    controller.addStatusListener((listener) {
      if (listener == AnimationStatus.dismissed) {
        setState(() {
          fabExpanded = false;
        });
      } else {
        setState(() {
          fabExpanded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              RenderBox object = context.findRenderObject();
              Offset localPosition =
                  object.globalToLocal(details.globalPosition);
              points = new List.from(points);
              points.add(localPosition);
            });
          },
          onPanEnd: (DragEndDetails details) => points.add(null),
          child: CustomPaint(
            painter: Painter(
                points: points,
                color: color,
                strokeCap: strokeCap,
                strokeWidth: strokeWidth,
                painters: painters),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          fabExpanded
              ? Container(
                  height: 70.0,
                  width: 56.0,
                  alignment: FractionalOffset.topCenter,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 1.0 - 0 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.clear),
                      onPressed: () {
                        points.clear();
                        for (Painter painter in painters) {
                          painter.points.clear();
                        }
                      },
                    ),
                  ),
                )
              : null,
          fabExpanded
              ? Container(
                  height: 70.0,
                  width: 56.0,
                  alignment: FractionalOffset.topCenter,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 1.0 - 1 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.lens),
                      onPressed: () async {
                        double temp;
                        temp = await showDialog(
                            context: context,
                            builder: (context) =>
                                WidthDialog(strokeWidth: strokeWidth));
                        if (temp != null) {
                          setState(() {
                            painters.add(Painter(
                                points: points.toList(),
                                color: color,
                                strokeCap: strokeCap,
                                strokeWidth: strokeWidth));
                            points.clear();
                            strokeWidth = temp;
                          });
                        }
                      },
                    ),
                  ),
                )
              : null,
          fabExpanded
              ? Container(
                  height: 70.0,
                  width: 56.0,
                  alignment: FractionalOffset.topCenter,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: controller,
                      curve: Interval(0.0, 1.0 - 2 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.color_lens),
                      onPressed: () async {
                        Color temp;
                        temp = await showDialog(
                            context: context,
                            builder: (context) => ColorDialog());
                        if (temp != null) {
                          setState(() {
                            painters.add(Painter(
                                points: points.toList(),
                                color: color,
                                strokeCap: strokeCap,
                                strokeWidth: strokeWidth));
                            points.clear();
                            color = temp;
                          });
                        }
                      },
                    ),
                  ),
                )
              : null,
          FloatingActionButton(
            child: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform:
                      Matrix4.rotationZ(controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(Icons.brush),
                );
              },
            ),
            onPressed: () {
              if (controller.isDismissed) {
                controller.forward();
              } else {
                controller.reverse();
              }
            },
          ),
        ].where((widget) => widget != null).toList(),
      ),
    );
  }
}
