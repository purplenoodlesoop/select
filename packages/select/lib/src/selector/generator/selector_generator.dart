import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:select/src/core/error/enum_source_error.dart';
import 'package:select/src/core/generator/code_producer.dart';
import 'package:select/src/selector/model/field_information.dart';
import 'package:select/src/selector/visitor/field_accumulator_visitor.dart';
import 'package:select_annotation/select_annotation.dart';
import 'package:source_gen/source_gen.dart';

abstract class SelectableClassInformation {
  abstract final String? className;
  abstract final Set<FieldInformation> fields;
}

class SelectorGenerator extends GeneratorForAnnotation<Selectable> {
  final CodeProducer<Set<FieldInformation>> _producer;

  SelectorGenerator({
    required CodeProducer<Set<FieldInformation>> producer,
  }) : _producer = producer;

  static SelectableClassInformation _accumulateInformation(Element element) {
    final visitor = FieldAccumulatorVisitor();

    element.visitChildren(visitor);

    return visitor;
  }

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final information = _accumulateInformation(element);
    final className = information.className;

    return className == null
        ? throw GenerationSourceError(
            annotation: 'selectable',
            type: 'Class',
            element: element,
          )
        : _producer.produce(className, information.fields);
  }
}
