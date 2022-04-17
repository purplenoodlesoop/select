import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:select/src/logic/selector_code_builder.dart';
import 'package:select/src/logic/selector_code_producer.dart';
import 'package:select/src/generator/selector_generator.dart';
import 'package:source_gen/source_gen.dart';

const String _extension = '.select.dart';

const String _header = '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
''';

List<Generator> _generateSelectGenerators(BuilderOptions options) => [
      SelectorGenerator(
        producer: CodeBuilderCodeProducer(
          dartEmitter: DartEmitter(useNullSafetySyntax: true),
          assembler: const SelectorCodeBuilderAssembler(),
        ),
      ),
    ];

Builder generateSelect(BuilderOptions options) => PartBuilder(
      _generateSelectGenerators(options),
      _extension,
      header: _header,
    );
