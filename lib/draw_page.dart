import 'dart:math' as math;
import 'package:built_collection/built_collection.dart';
import 'package:drawapp/bloc/painter_bloc.dart';
import 'package:drawapp/dialogs/color_dialog.dart';
import 'package:drawapp/dialogs/width_dialog.dart';
import 'package:drawapp/models/clear.dart';
import 'package:drawapp/models/color.dart';
import 'package:drawapp/models/end_touch.dart';
import 'package:drawapp/models/stroke.dart';
import 'package:drawapp/models/stroke_width.dart';
import 'package:drawapp/models/touch_location.dart';
import 'package:drawapp/strokes_painter.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  @override
  DrawPageState createState() => DrawPageState();
}

class DrawPageState extends State<DrawPage> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  final StrokeCap _strokeCap = StrokeCap.round;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // The widgets returned by build(...) change when animationStatus changes
    _controller.addStatusListener((newAnimationStatus) {
      if (newAnimationStatus != _animationStatus) {
        setState(() {
          _animationStatus = newAnimationStatus;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PainterBloc>(context);

    return Scaffold(
      body: Container(
        child: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            setState(() {
              final RenderBox object = context.findRenderObject();
              final localPosition =
                  object.globalToLocal(details.globalPosition);
              bloc.drawEvent.add(TouchLocationEvent((builder) {
                builder
                  ..x = localPosition.dx
                  ..y = localPosition.dy;
              }));
            });
          },
          onPanEnd: (DragEndDetails details) =>
              bloc.drawEvent.add(EndTouchEvent()),
          child: StreamBuilder<BuiltList<Stroke>>(
            stream: bloc.strokes,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: StrokesPainter(
                    strokeCap: _strokeCap, strokes: snapshot.data),
                size: Size.infinite,
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  width: 56.0,
                  alignment: FractionalOffset.topCenter,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(0.0, 1.0 - 0 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.clear),
                      onPressed: () {
                        bloc.drawEvent.add(ClearEvent());
                      },
                    ),
                  ),
                )
              : null,
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  width: 56.0,
                  alignment: FractionalOffset.topCenter,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(0.0, 1.0 - 1 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.lens),
                      onPressed: () async {
                        bloc.width.take(1).listen((final strokeWidth) async {
                          final newWidth = await showDialog(
                              context: context,
                              builder: (context) =>
                                  WidthDialog(strokeWidth: strokeWidth));
                          if (newWidth != null) {
                            bloc.drawEvent
                                .add(StrokeWidthChangeEvent((builder) {
                              builder.width = newWidth;
                            }));
                          }
                        });
                      },
                    ),
                  ),
                )
              : null,
          !_controller.isDismissed
              ? Container(
                  height: 70.0,
                  width: 56.0,
                  alignment: FractionalOffset.topCenter,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(0.0, 1.0 - 2 / 3 / 2.0,
                          curve: Curves.easeOut),
                    ),
                    child: FloatingActionButton(
                      mini: true,
                      child: Icon(Icons.color_lens),
                      onPressed: () async {
                        bloc.color.take(1).listen((final color) async {
                          final newColor = await showDialog(
                            context: context,
                            builder: (context) => ColorDialog(),
                          ) as Color;
                          if (newColor != null) {
                            bloc.drawEvent.add(ColorChangeEvent((builder) {
                              builder
                                ..red = newColor.red
                                ..green = newColor.green
                                ..blue = newColor.blue;
                            }));
                          }
                        });
                      },
                    ),
                  ),
                )
              : null,
          FloatingActionButton(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform:
                      Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: Icon(Icons.brush),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ].where((widget) => widget != null).toList(),
      ),
    );
  }
}
