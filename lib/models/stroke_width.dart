import 'package:built_value/built_value.dart';
import './draw_event.dart';

// Generated code part of this Built Value.
// Generate using `flutter packages pub run build_runner build`
part 'stroke_width.g.dart';

abstract class StrokeWidthChangeEvent
    implements
        Built<StrokeWidthChangeEvent, StrokeWidthChangeEventBuilder>,
        DrawEvent {
  double get width;

  StrokeWidthChangeEvent._();
  factory StrokeWidthChangeEvent([updates(StrokeWidthChangeEventBuilder b)]) =
      _$StrokeWidthChangeEvent;
}
