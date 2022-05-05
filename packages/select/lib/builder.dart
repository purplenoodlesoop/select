import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:select/src/matcher/generator/matcher_generator.dart';
import 'package:select/src/matcher/logic/builder_matcher_code_producer.dart';
import 'package:select/src/selector/generator/selector_generator.dart';
import 'package:select/src/selector/logic/builder_selector_code_producer.dart';
import 'package:source_gen/source_gen.dart';

const String _extension = '.select.dart';

const String _header = '''
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
''';

Builder generateSelect(BuilderOptions options) {
  final emitter = DartEmitter(useNullSafetySyntax: true);

  return PartBuilder(
    [
      SelectorGenerator(
        producer: BuilderSelectorCodeProducer(
          dartEmitter: emitter,
        ),
      ),
      MatcherGenerator(
        producer: BuilderMatcherCodeProducer(
          emitter: emitter,
        ),
      ),
    ],
    _extension,
    header: _header,
  );
}
