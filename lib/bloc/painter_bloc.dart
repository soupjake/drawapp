import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import '../models/color.dart';
import '../models/draw_event.dart';
import '../models/end_touch.dart';
import '../models/stroke.dart';
import '../models/stroke_width.dart';
import '../models/touch_location.dart';

// Implementing BLoC pattern using the following as a guide
// https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/

abstract class BlocBase {
  void dispose();
}

class PainterBloc extends BlocBase {
  // Completed strokes
  BuiltList<Stroke> _strokes = BuiltList<Stroke>();

  // In progress stroke
  BuiltList<TouchLocation> _locations = BuiltList<TouchLocation>();
  Color _color = (ColorBuilder()
        ..red = 0
        ..green = 0
        ..blue = 0)
      .build();
  int _width = 1;

  // Streamed input into this BLoC
  final _drawEvents = PublishSubject<DrawEvent>();
  StreamSink<DrawEvent> get drawEvent => _drawEvents.sink;

  // Streamed output from this BLoC
  final _strokesController = PublishSubject<BuiltList<Stroke>>();
  StreamSink<BuiltList<Stroke>> get _strokesOut => _strokesController.sink;
  Observable<BuiltList<Stroke>> get strokes => _strokesController.stream;

  PainterBloc() {
    _drawEvents.stream.listen((drawEvent) {
      if (drawEvent is Color) {
        finalizeCurrentStroke();
        _color = drawEvent;
      } else if (drawEvent is TouchLocation) {
        _locations = (_locations.toBuilder()..add(drawEvent)).build();
        final allStrokes = (_strokes.toBuilder()..add(_stroke)).build();
        _strokesOut.add(allStrokes);
      } else if (drawEvent is EndTouch) {
        finalizeCurrentStroke();
      } else if (drawEvent is StrokeWidth) {
        finalizeCurrentStroke();
        _width = drawEvent.width;
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
      _locations = BuiltList<TouchLocation>();
    }
  }

  @override
  void dispose() {
    _drawEvents.close();
    _strokesController.close();
  }
}
