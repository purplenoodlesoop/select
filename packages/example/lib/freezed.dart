import 'package:example/example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:select_annotation/select_annotation.dart';

part 'freezed.freezed.dart';
part 'freezed.select.dart';

@freezed
@selectable
class FreezedExample with _$FreezedExample {
  const factory FreezedExample({
    required String value,
    required String other,
    required int andMore,
    required Whole evenACustomType,
  }) = FreezedExampleOne;
}
