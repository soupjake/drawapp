import 'package:test/test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:drawapp/bloc/painter_bloc.dart';
import 'package:drawapp/models/touch_location.dart';
import 'package:drawapp/models/stroke.dart';

void main() {
  test('PainterBloc', () {
    final painterBloc = PainterBloc();
    var _strokes = BuiltList<Stroke>();
    painterBloc.strokes.listen((strokes) {
      _strokes = strokes;
    });
    expect(_strokes.length, 0);
    painterBloc.touchLocation.add(TouchLocation((builder) {
      builder
        ..x = 1
        ..y = 2;
    }));
    painterBloc.touchLocation.add(TouchLocation((builder) {
      builder
        ..x = 5
        ..y = 6;
    }));
    expect(_strokes.length, 1);
  });
}
