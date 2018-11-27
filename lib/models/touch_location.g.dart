// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'touch_location.dart';

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

class _$TouchLocationEvent extends TouchLocationEvent {
  @override
  final double x;
  @override
  final double y;

  factory _$TouchLocationEvent([void updates(TouchLocationEventBuilder b)]) =>
      (new TouchLocationEventBuilder()..update(updates)).build();

  _$TouchLocationEvent._({this.x, this.y}) : super._() {
    if (x == null) {
      throw new BuiltValueNullFieldError('TouchLocationEvent', 'x');
    }
    if (y == null) {
      throw new BuiltValueNullFieldError('TouchLocationEvent', 'y');
    }
  }

  @override
  TouchLocationEvent rebuild(void updates(TouchLocationEventBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TouchLocationEventBuilder toBuilder() =>
      new TouchLocationEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TouchLocationEvent && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TouchLocationEvent')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class TouchLocationEventBuilder
    implements Builder<TouchLocationEvent, TouchLocationEventBuilder> {
  _$TouchLocationEvent _$v;

  double _x;
  double get x => _$this._x;
  set x(double x) => _$this._x = x;

  double _y;
  double get y => _$this._y;
  set y(double y) => _$this._y = y;

  TouchLocationEventBuilder();

  TouchLocationEventBuilder get _$this {
    if (_$v != null) {
      _x = _$v.x;
      _y = _$v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TouchLocationEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TouchLocationEvent;
  }

  @override
  void update(void updates(TouchLocationEventBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TouchLocationEvent build() {
    final _$result = _$v ?? new _$TouchLocationEvent._(x: x, y: y);
    replace(_$result);
    return _$result;
  }
}
