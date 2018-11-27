import 'package:built_value/built_value.dart';
import './draw_event.dart';

// Generated code part of this Built Value.
// Generate using `flutter packages pub run build_runner build`
part 'stroke_width.g.dart';

abstract class StrokeWidth
    implements Built<StrokeWidth, StrokeWidthBuilder>, DrawEvent {
  int get width;

  StrokeWidth._();
  factory StrokeWidth([updates(StrokeWidthBuilder b)]) = _$StrokeWidth;
}
