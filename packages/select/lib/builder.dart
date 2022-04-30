import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:select/src/generator/selector_generator.dart';
import 'package:select/src/logic/builder_selector_code_producer.dart';
import 'package:source_gen/source_gen.dart';

const String _extension = '.select.dart';

const String _header = '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
''';

Builder _partBuilder({required List<Generator> generators}) => PartBuilder(
      generators,
      _extension,
      header: _header,
    );

Builder generateSelect(BuilderOptions options) => _partBuilder(
      generators: [
        SelectorGenerator(
          producer: BuilderSelectorCodeProducer(
            dartEmitter: DartEmitter(useNullSafetySyntax: true),
          ),
        ),
      ],
    );
