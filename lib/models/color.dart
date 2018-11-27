import 'package:built_value/built_value.dart';
import './draw_event.dart';

// Generated code part of this Built Value.
// Generate using `flutter packages pub run build_runner build`
part 'color.g.dart';

abstract class ColorChangeEvent
    implements Built<ColorChangeEvent, ColorChangeEventBuilder>, DrawEvent {
  int get red;
  int get green;
  int get blue;

  ColorChangeEvent._();
  factory ColorChangeEvent([updates(ColorChangeEventBuilder b)]) =
      _$ColorChangeEvent;
}
