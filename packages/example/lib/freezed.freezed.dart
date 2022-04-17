// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FreezedExampleTearOff {
  const _$FreezedExampleTearOff();

  FreezedExampleOne one({required String value}) {
    return FreezedExampleOne(
      value: value,
    );
  }

  FreezedExampleTwo two({required int other}) {
    return FreezedExampleTwo(
      other: other,
    );
  }
}

/// @nodoc
const $FreezedExample = _$FreezedExampleTearOff();

/// @nodoc
mixin _$FreezedExample {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) one,
    required TResult Function(int other) two,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? one,
    TResult Function(int other)? two,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? one,
    TResult Function(int other)? two,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FreezedExampleOne value) one,
    required TResult Function(FreezedExampleTwo value) two,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FreezedExampleOne value)? one,
    TResult Function(FreezedExampleTwo value)? two,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FreezedExampleOne value)? one,
    TResult Function(FreezedExampleTwo value)? two,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedExampleCopyWith<$Res> {
  factory $FreezedExampleCopyWith(
          FreezedExample value, $Res Function(FreezedExample) then) =
      _$FreezedExampleCopyWithImpl<$Res>;
}

/// @nodoc
class _$FreezedExampleCopyWithImpl<$Res>
    implements $FreezedExampleCopyWith<$Res> {
  _$FreezedExampleCopyWithImpl(this._value, this._then);

  final FreezedExample _value;
  // ignore: unused_field
  final $Res Function(FreezedExample) _then;
}

/// @nodoc
abstract class $FreezedExampleOneCopyWith<$Res> {
  factory $FreezedExampleOneCopyWith(
          FreezedExampleOne value, $Res Function(FreezedExampleOne) then) =
      _$FreezedExampleOneCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$FreezedExampleOneCopyWithImpl<$Res>
    extends _$FreezedExampleCopyWithImpl<$Res>
    implements $FreezedExampleOneCopyWith<$Res> {
  _$FreezedExampleOneCopyWithImpl(
      FreezedExampleOne _value, $Res Function(FreezedExampleOne) _then)
      : super(_value, (v) => _then(v as FreezedExampleOne));

  @override
  FreezedExampleOne get _value => super._value as FreezedExampleOne;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(FreezedExampleOne(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FreezedExampleOne implements FreezedExampleOne {
  const _$FreezedExampleOne({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'FreezedExample.one(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreezedExampleOne &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $FreezedExampleOneCopyWith<FreezedExampleOne> get copyWith =>
      _$FreezedExampleOneCopyWithImpl<FreezedExampleOne>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) one,
    required TResult Function(int other) two,
  }) {
    return one(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? one,
    TResult Function(int other)? two,
  }) {
    return one?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? one,
    TResult Function(int other)? two,
    required TResult orElse(),
  }) {
    if (one != null) {
      return one(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FreezedExampleOne value) one,
    required TResult Function(FreezedExampleTwo value) two,
  }) {
    return one(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FreezedExampleOne value)? one,
    TResult Function(FreezedExampleTwo value)? two,
  }) {
    return one?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FreezedExampleOne value)? one,
    TResult Function(FreezedExampleTwo value)? two,
    required TResult orElse(),
  }) {
    if (one != null) {
      return one(this);
    }
    return orElse();
  }
}

abstract class FreezedExampleOne implements FreezedExample {
  const factory FreezedExampleOne({required String value}) =
      _$FreezedExampleOne;

  String get value;
  @JsonKey(ignore: true)
  $FreezedExampleOneCopyWith<FreezedExampleOne> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedExampleTwoCopyWith<$Res> {
  factory $FreezedExampleTwoCopyWith(
          FreezedExampleTwo value, $Res Function(FreezedExampleTwo) then) =
      _$FreezedExampleTwoCopyWithImpl<$Res>;
  $Res call({int other});
}

/// @nodoc
class _$FreezedExampleTwoCopyWithImpl<$Res>
    extends _$FreezedExampleCopyWithImpl<$Res>
    implements $FreezedExampleTwoCopyWith<$Res> {
  _$FreezedExampleTwoCopyWithImpl(
      FreezedExampleTwo _value, $Res Function(FreezedExampleTwo) _then)
      : super(_value, (v) => _then(v as FreezedExampleTwo));

  @override
  FreezedExampleTwo get _value => super._value as FreezedExampleTwo;

  @override
  $Res call({
    Object? other = freezed,
  }) {
    return _then(FreezedExampleTwo(
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FreezedExampleTwo implements FreezedExampleTwo {
  const _$FreezedExampleTwo({required this.other});

  @override
  final int other;

  @override
  String toString() {
    return 'FreezedExample.two(other: $other)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreezedExampleTwo &&
            const DeepCollectionEquality().equals(other.other, this.other));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(other));

  @JsonKey(ignore: true)
  @override
  $FreezedExampleTwoCopyWith<FreezedExampleTwo> get copyWith =>
      _$FreezedExampleTwoCopyWithImpl<FreezedExampleTwo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) one,
    required TResult Function(int other) two,
  }) {
    return two(other);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String value)? one,
    TResult Function(int other)? two,
  }) {
    return two?.call(other);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? one,
    TResult Function(int other)? two,
    required TResult orElse(),
  }) {
    if (two != null) {
      return two(other);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FreezedExampleOne value) one,
    required TResult Function(FreezedExampleTwo value) two,
  }) {
    return two(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FreezedExampleOne value)? one,
    TResult Function(FreezedExampleTwo value)? two,
  }) {
    return two?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FreezedExampleOne value)? one,
    TResult Function(FreezedExampleTwo value)? two,
    required TResult orElse(),
  }) {
    if (two != null) {
      return two(this);
    }
    return orElse();
  }
}

abstract class FreezedExampleTwo implements FreezedExample {
  const factory FreezedExampleTwo({required int other}) = _$FreezedExampleTwo;

  int get other;
  @JsonKey(ignore: true)
  $FreezedExampleTwoCopyWith<FreezedExampleTwo> get copyWith =>
      throw _privateConstructorUsedError;
}
