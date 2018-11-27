// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroke_width.dart';

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

class _$StrokeWidth extends StrokeWidth {
  @override
  final int width;

  factory _$StrokeWidth([void updates(StrokeWidthBuilder b)]) =>
      (new StrokeWidthBuilder()..update(updates)).build();

  _$StrokeWidth._({this.width}) : super._() {
    if (width == null) {
      throw new BuiltValueNullFieldError('StrokeWidth', 'width');
    }
  }

  @override
  StrokeWidth rebuild(void updates(StrokeWidthBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StrokeWidthBuilder toBuilder() => new StrokeWidthBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StrokeWidth && width == other.width;
  }

  @override
  int get hashCode {
    return $jf($jc(0, width.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StrokeWidth')..add('width', width))
        .toString();
  }
}

class StrokeWidthBuilder implements Builder<StrokeWidth, StrokeWidthBuilder> {
  _$StrokeWidth _$v;

  int _width;
  int get width => _$this._width;
  set width(int width) => _$this._width = width;

  StrokeWidthBuilder();

  StrokeWidthBuilder get _$this {
    if (_$v != null) {
      _width = _$v.width;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StrokeWidth other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StrokeWidth;
  }

  @override
  void update(void updates(StrokeWidthBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$StrokeWidth build() {
    final _$result = _$v ?? new _$StrokeWidth._(width: width);
    replace(_$result);
    return _$result;
  }
}
