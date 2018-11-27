import 'package:built_value/built_value.dart';

// Generated code part of this Built Value.
// Generate using `flutter packages pub run build_runner build`
part 'touch_location.g.dart';

abstract class TouchLocation implements Built<TouchLocation, TouchLocationBuilder> {
  int get x;
  int get y;

  TouchLocation._();
  factory TouchLocation([updates(TouchLocationBuilder b)]) = _$TouchLocation;
}
