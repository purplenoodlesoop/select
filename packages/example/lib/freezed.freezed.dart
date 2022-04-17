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

  FreezedExampleOne call(
      {required String value,
      required String other,
      required int andMore,
      required Whole evenACustomType}) {
    return FreezedExampleOne(
      value: value,
      other: other,
      andMore: andMore,
      evenACustomType: evenACustomType,
    );
  }
}

/// @nodoc
const $FreezedExample = _$FreezedExampleTearOff();

/// @nodoc
mixin _$FreezedExample {
  String get value => throw _privateConstructorUsedError;
  String get other => throw _privateConstructorUsedError;
  int get andMore => throw _privateConstructorUsedError;
  Whole get evenACustomType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreezedExampleCopyWith<FreezedExample> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedExampleCopyWith<$Res> {
  factory $FreezedExampleCopyWith(
          FreezedExample value, $Res Function(FreezedExample) then) =
      _$FreezedExampleCopyWithImpl<$Res>;
  $Res call({String value, String other, int andMore, Whole evenACustomType});
}

/// @nodoc
class _$FreezedExampleCopyWithImpl<$Res>
    implements $FreezedExampleCopyWith<$Res> {
  _$FreezedExampleCopyWithImpl(this._value, this._then);

  final FreezedExample _value;
  // ignore: unused_field
  final $Res Function(FreezedExample) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? other = freezed,
    Object? andMore = freezed,
    Object? evenACustomType = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String,
      andMore: andMore == freezed
          ? _value.andMore
          : andMore // ignore: cast_nullable_to_non_nullable
              as int,
      evenACustomType: evenACustomType == freezed
          ? _value.evenACustomType
          : evenACustomType // ignore: cast_nullable_to_non_nullable
              as Whole,
    ));
  }
}

/// @nodoc
abstract class $FreezedExampleOneCopyWith<$Res>
    implements $FreezedExampleCopyWith<$Res> {
  factory $FreezedExampleOneCopyWith(
          FreezedExampleOne value, $Res Function(FreezedExampleOne) then) =
      _$FreezedExampleOneCopyWithImpl<$Res>;
  @override
  $Res call({String value, String other, int andMore, Whole evenACustomType});
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
    Object? other = freezed,
    Object? andMore = freezed,
    Object? evenACustomType = freezed,
  }) {
    return _then(FreezedExampleOne(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as String,
      andMore: andMore == freezed
          ? _value.andMore
          : andMore // ignore: cast_nullable_to_non_nullable
              as int,
      evenACustomType: evenACustomType == freezed
          ? _value.evenACustomType
          : evenACustomType // ignore: cast_nullable_to_non_nullable
              as Whole,
    ));
  }
}

/// @nodoc

class _$FreezedExampleOne implements FreezedExampleOne {
  const _$FreezedExampleOne(
      {required this.value,
      required this.other,
      required this.andMore,
      required this.evenACustomType});

  @override
  final String value;
  @override
  final String other;
  @override
  final int andMore;
  @override
  final Whole evenACustomType;

  @override
  String toString() {
    return 'FreezedExample(value: $value, other: $other, andMore: $andMore, evenACustomType: $evenACustomType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreezedExampleOne &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.other, this.other) &&
            const DeepCollectionEquality().equals(other.andMore, andMore) &&
            const DeepCollectionEquality()
                .equals(other.evenACustomType, evenACustomType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(other),
      const DeepCollectionEquality().hash(andMore),
      const DeepCollectionEquality().hash(evenACustomType));

  @JsonKey(ignore: true)
  @override
  $FreezedExampleOneCopyWith<FreezedExampleOne> get copyWith =>
      _$FreezedExampleOneCopyWithImpl<FreezedExampleOne>(this, _$identity);
}

abstract class FreezedExampleOne implements FreezedExample {
  const factory FreezedExampleOne(
      {required String value,
      required String other,
      required int andMore,
      required Whole evenACustomType}) = _$FreezedExampleOne;

  @override
  String get value;
  @override
  String get other;
  @override
  int get andMore;
  @override
  Whole get evenACustomType;
  @override
  @JsonKey(ignore: true)
  $FreezedExampleOneCopyWith<FreezedExampleOne> get copyWith =>
      throw _privateConstructorUsedError;
}
