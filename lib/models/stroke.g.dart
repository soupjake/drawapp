// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

class _$Stroke extends Stroke {
  @override
  final BuiltList<TouchLocation> locations;
  @override
  final int strokeWidth;
  @override
  final Color color;

  factory _$Stroke([void updates(StrokeBuilder b)]) =>
      (new StrokeBuilder()..update(updates)).build();

  _$Stroke._({this.locations, this.strokeWidth, this.color}) : super._() {
    if (locations == null) {
      throw new BuiltValueNullFieldError('Stroke', 'locations');
    }
    if (strokeWidth == null) {
      throw new BuiltValueNullFieldError('Stroke', 'strokeWidth');
    }
    if (color == null) {
      throw new BuiltValueNullFieldError('Stroke', 'color');
    }
  }

  @override
  Stroke rebuild(void updates(StrokeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StrokeBuilder toBuilder() => new StrokeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stroke &&
        locations == other.locations &&
        strokeWidth == other.strokeWidth &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, locations.hashCode), strokeWidth.hashCode), color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Stroke')
          ..add('locations', locations)
          ..add('strokeWidth', strokeWidth)
          ..add('color', color))
        .toString();
  }
}

class StrokeBuilder implements Builder<Stroke, StrokeBuilder> {
  _$Stroke _$v;

  ListBuilder<TouchLocation> _locations;
  ListBuilder<TouchLocation> get locations =>
      _$this._locations ??= new ListBuilder<TouchLocation>();
  set locations(ListBuilder<TouchLocation> locations) =>
      _$this._locations = locations;

  int _strokeWidth;
  int get strokeWidth => _$this._strokeWidth;
  set strokeWidth(int strokeWidth) => _$this._strokeWidth = strokeWidth;

  ColorBuilder _color;
  ColorBuilder get color => _$this._color ??= new ColorBuilder();
  set color(ColorBuilder color) => _$this._color = color;

  StrokeBuilder();

  StrokeBuilder get _$this {
    if (_$v != null) {
      _locations = _$v.locations?.toBuilder();
      _strokeWidth = _$v.strokeWidth;
      _color = _$v.color?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Stroke other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Stroke;
  }

  @override
  void update(void updates(StrokeBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Stroke build() {
    _$Stroke _$result;
    try {
      _$result = _$v ??
          new _$Stroke._(
              locations: locations.build(),
              strokeWidth: strokeWidth,
              color: color.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'locations';
        locations.build();

        _$failedField = 'color';
        color.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Stroke', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
