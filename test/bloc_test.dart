import 'package:test/test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:drawapp/bloc/painter_bloc.dart';
import 'package:drawapp/models/touch_location.dart';
import 'package:drawapp/models/stroke.dart';

void main() {
  test('Simple stroke', () {
    final painterBloc = PainterBloc();
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
    painterBloc.endTouch.add(null);
    var callCount = 0;
    painterBloc.strokes.listen(expectAsync1(
      (strokes) {
        callCount++;
        if (callCount > 1) {
          expect(strokes.length, 1);
          expect(strokes[0].locations.length, 2);
          expect(strokes[0].locations[0].x, 1);
          expect(strokes[0].locations[0].y, 2);
          expect(strokes[0].locations[1].x, 5);
          expect(strokes[0].locations[1].y, 6);
        }
      },
      count: 3,
    ));
  });

  test('Change color splits strokes', () {});
}
