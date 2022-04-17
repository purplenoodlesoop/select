import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:select/src/selector_code_builder.dart';
import 'package:select/src/selector_code_producer.dart';
import 'package:select/src/selector_generator.dart';
import 'package:source_gen/source_gen.dart';

const String _header = '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
''';

Builder generateSelect(BuilderOptions options) => PartBuilder(
      [
        SelectorGenerator(
          producer: CodeBuilderCodeProducer(
            dartEmitter: DartEmitter(useNullSafetySyntax: true),
            builder: const SelectorCodeBuilder(),
          ),
        ),
      ],
      '.select.dart',
      header: _header,
    );
