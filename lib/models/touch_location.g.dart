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

class _$TouchLocation extends TouchLocation {
  @override
  final int x;
  @override
  final int y;

  factory _$TouchLocation([void updates(TouchLocationBuilder b)]) =>
      (new TouchLocationBuilder()..update(updates)).build();

  _$TouchLocation._({this.x, this.y}) : super._() {
    if (x == null) {
      throw new BuiltValueNullFieldError('TouchLocation', 'x');
    }
    if (y == null) {
      throw new BuiltValueNullFieldError('TouchLocation', 'y');
    }
  }

  @override
  TouchLocation rebuild(void updates(TouchLocationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TouchLocationBuilder toBuilder() => new TouchLocationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TouchLocation && x == other.x && y == other.y;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, x.hashCode), y.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TouchLocation')
          ..add('x', x)
          ..add('y', y))
        .toString();
  }
}

class TouchLocationBuilder
    implements Builder<TouchLocation, TouchLocationBuilder> {
  _$TouchLocation _$v;

  int _x;
  int get x => _$this._x;
  set x(int x) => _$this._x = x;

  int _y;
  int get y => _$this._y;
  set y(int y) => _$this._y = y;

  TouchLocationBuilder();

  TouchLocationBuilder get _$this {
    if (_$v != null) {
      _x = _$v.x;
      _y = _$v.y;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TouchLocation other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$TouchLocation;
  }

  @override
  void update(void updates(TouchLocationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TouchLocation build() {
    final _$result = _$v ?? new _$TouchLocation._(x: x, y: y);
    replace(_$result);
    return _$result;
  }
}
