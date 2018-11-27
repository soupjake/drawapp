import 'package:built_value/built_value.dart';
import './draw_event.dart';

// Generated code part of this Built Value.
// Generate using `flutter packages pub run build_runner build`
part 'touch_location.g.dart';

abstract class TouchLocationEvent
    implements Built<TouchLocationEvent, TouchLocationEventBuilder>, DrawEvent {
  double get x;
  double get y;

  TouchLocationEvent._();
  factory TouchLocationEvent([updates(TouchLocationEventBuilder b)]) =
      _$TouchLocationEvent;
}
