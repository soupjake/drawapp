// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

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

class _$Color extends Color {
  @override
  final int red;
  @override
  final int green;
  @override
  final int blue;

  factory _$Color([void updates(ColorBuilder b)]) =>
      (new ColorBuilder()..update(updates)).build();

  _$Color._({this.red, this.green, this.blue}) : super._() {
    if (red == null) {
      throw new BuiltValueNullFieldError('Color', 'red');
    }
    if (green == null) {
      throw new BuiltValueNullFieldError('Color', 'green');
    }
    if (blue == null) {
      throw new BuiltValueNullFieldError('Color', 'blue');
    }
  }

  @override
  Color rebuild(void updates(ColorBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ColorBuilder toBuilder() => new ColorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Color &&
        red == other.red &&
        green == other.green &&
        blue == other.blue;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, red.hashCode), green.hashCode), blue.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Color')
          ..add('red', red)
          ..add('green', green)
          ..add('blue', blue))
        .toString();
  }
}

class ColorBuilder implements Builder<Color, ColorBuilder> {
  _$Color _$v;

  int _red;
  int get red => _$this._red;
  set red(int red) => _$this._red = red;

  int _green;
  int get green => _$this._green;
  set green(int green) => _$this._green = green;

  int _blue;
  int get blue => _$this._blue;
  set blue(int blue) => _$this._blue = blue;

  ColorBuilder();

  ColorBuilder get _$this {
    if (_$v != null) {
      _red = _$v.red;
      _green = _$v.green;
      _blue = _$v.blue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Color other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Color;
  }

  @override
  void update(void updates(ColorBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Color build() {
    final _$result = _$v ?? new _$Color._(red: red, green: green, blue: blue);
    replace(_$result);
    return _$result;
  }
}
