import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:select/src/core/error/enum_source_error.dart';
import 'package:select/src/core/generator/code_producer.dart';
import 'package:select/src/matcher/logic/enum_field_parser.dart';
import 'package:select_annotation/select_annotation.dart';
import 'package:source_gen/source_gen.dart';

class MatcherGenerator extends GeneratorForAnnotation<Matchable> {
  final CodeProducer<Set<String>> _producer;

  MatcherGenerator({
    required CodeProducer<Set<String>> producer,
  }) : _producer = producer;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) =>
      element is! ClassElement || !element.isEnum
          ? throw GenerationSourceError(
              annotation: 'matchable',
              type: 'Enum',
              element: element,
            )
          : _producer.produce(element.displayName, parseEnumFields(element));
}
