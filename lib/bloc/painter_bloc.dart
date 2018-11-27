import 'dart:async';
import 'package:built_collection/built_collection.dart';
import 'package:rxdart/rxdart.dart';
import '../models/color.dart';
import '../models/stroke.dart';
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
  final _touchLocationController = PublishSubject<TouchLocation>();
  StreamSink<TouchLocation> get touchLocation => _touchLocationController.sink;

  final _colorController = PublishSubject<Color>();
  StreamSink<Color> get color => _colorController.sink;

  final _widthController = PublishSubject<int>();
  StreamSink<int> get strokeWidth => _widthController.sink;

  final _endTouchController = PublishSubject<void>();
  StreamSink<void> get endTouch => _endTouchController.sink;

  // Streamed output from this BLoC
  final _strokesController = PublishSubject<BuiltList<Stroke>>();
  StreamSink<BuiltList<Stroke>> get _strokesOut => _strokesController.sink;
  Observable<BuiltList<Stroke>> get strokes => _strokesController.stream;

  PainterBloc() {
    // Adding a touch continues the current stroke
    _touchLocationController.stream.listen((touchLocation) {
      _locations = (_locations.toBuilder()..add(touchLocation)).build();
      final allStrokes = (_strokes.toBuilder()..add(_stroke)).build();
      _strokesOut.add(allStrokes);
    });

    // Changing the color finishes the current stroke
    _colorController.stream.listen((color) {
      finalizeCurrentStroke();
      _color = color;
    });

    // As does changing the stroke width
    _widthController.stream.listen((width) {
      finalizeCurrentStroke();
      _width = width;
    });

    // And ending the touch
    _endTouchController.stream.listen((_) {
      finalizeCurrentStroke();
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
    _touchLocationController.close();
    _colorController.close();
    _widthController.close();
    _strokesController.close();
    _endTouchController.close();
  }
}
