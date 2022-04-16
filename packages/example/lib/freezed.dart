import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:select_annotation/select_annotation.dart';

part 'freezed.freezed.dart';
part 'freezed.select.dart';

@freezed
class FreezedExample with _$FreezedExample {
  @selectable
  const factory FreezedExample.one({
    required String value,
  }) = FreezedExampleOne;
}
