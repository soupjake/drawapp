import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../models/clear.dart';
import '../models/color.dart';
import '../models/draw_event.dart';
import '../models/end_touch.dart';
import '../models/stroke.dart';
import '../models/stroke_width.dart';
import '../models/touch_location.dart';

part 'bloc_provider.dart';

class PainterBloc extends BlocBase {
  // Completed strokes
  BuiltList<Stroke> _strokes = BuiltList<Stroke>();

  // In progress stroke
  BuiltList<TouchLocationEvent> _locations = BuiltList<TouchLocationEvent>();
  ColorChangeEvent _color = (ColorChangeEventBuilder()
        ..red = 0
        ..green = 0
        ..blue = 0)
      .build();
  double _width = 1;

  // Streamed input into this BLoC
  final _drawEvents = BehaviorSubject<DrawEvent>();
  StreamSink<DrawEvent> get drawEvent => _drawEvents.sink;

  // Streamed outputs from this BLoC
  final _strokesSubject = BehaviorSubject<BuiltList<Stroke>>();
  StreamSink<BuiltList<Stroke>> get _strokesOut => _strokesSubject.sink;
  ValueObservable<BuiltList<Stroke>> get strokes => _strokesSubject.stream;

  final _colorSubject = BehaviorSubject<ColorChangeEvent>();
  StreamSink<ColorChangeEvent> get _colorOut => _colorSubject.sink;
  ValueObservable<ColorChangeEvent> get color => _colorSubject.stream;

  final _widthSubject = BehaviorSubject<double>();
  StreamSink<double> get _widthOut => _widthSubject.sink;
  ValueObservable<double> get width => _widthSubject.stream;

  PainterBloc() {
    // Publish initial state
    _strokesOut.add(_strokes);
    _colorOut.add(_color);
    _widthOut.add(_width);

    // Update state based on events
    _drawEvents.stream.listen((drawEvent) {
      if (drawEvent is ClearEvent) {
        _strokes = BuiltList<Stroke>();
        _locations = BuiltList<TouchLocationEvent>();
        _strokesOut.add(_strokes);
      } else if (drawEvent is ColorChangeEvent) {
        finalizeCurrentStroke();
        _color = drawEvent;
        _colorOut.add(_color);
      } else if (drawEvent is TouchLocationEvent) {
        _locations = (_locations.toBuilder()..add(drawEvent)).build();
        final allStrokes = (_strokes.toBuilder()..add(_stroke)).build();
        _strokesOut.add(allStrokes);
      } else if (drawEvent is EndTouchEvent) {
        finalizeCurrentStroke();
      } else if (drawEvent is StrokeWidthChangeEvent) {
        finalizeCurrentStroke();
        _width = drawEvent.width;
        _widthOut.add(_width);
      } else {
        throw UnimplementedError('Unknown DrawEvent type: $drawEvent');
      }
    });
  }

  Stroke get _stroke => Stroke(
        (strokeBuilder) {
          strokeBuilder
            ..strokeWidth = _width
            ..color = _color.toBuilder()
            ..locations = _locations.toBuilder();
        },
      );

  void finalizeCurrentStroke() {
    if (_locations.length > 0) {
      _strokes = (_strokes.toBuilder()..add(_stroke)).build();
      _strokesOut.add(_strokes);
      _locations = BuiltList<TouchLocationEvent>();
    }
  }

  @override
  void dispose() {
    _drawEvents.close();
    _strokesSubject.close();
    _colorSubject.close();
    _strokesSubject.close();
  }
}
