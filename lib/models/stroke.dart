import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import './color.dart';
import './touch_location.dart';

// Generated code part of this Built Value.
// Generate using `flutter packages pub run build_runner build`
part 'stroke.g.dart';

abstract class Stroke implements Built<Stroke, StrokeBuilder> {
  BuiltList<TouchLocationEvent> get locations;
  double get strokeWidth;
  ColorChangeEvent get color;

  Stroke._();
  factory Stroke([updates(StrokeBuilder b)]) = _$Stroke;
}
