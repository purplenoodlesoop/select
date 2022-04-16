import 'package:build/build.dart';
import 'package:select/src/selector_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder generateSelect(BuilderOptions options) => PartBuilder(
      [SelectorGenerator()],
      '.select.dart',
      header: '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
      ''',
    );
