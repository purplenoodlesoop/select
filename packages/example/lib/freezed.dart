import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:select_annotation/select_annotation.dart';

part 'freezed.freezed.dart';
//part 'freezed.select.dart';

@freezed
class FreezedExample with _$FreezedExample {
  const factory FreezedExample.one({
    required String value,
  }) = FreezedExampleOne;

  const factory FreezedExample.two({
    required int other,
  }) = FreezedExampleTwo;
}
