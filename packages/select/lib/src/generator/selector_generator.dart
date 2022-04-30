import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:select/src/model/field_information.dart';
import 'package:select/src/visitor/field_accumulator_visitor.dart';
import 'package:select_annotation/select_annotation.dart';
import 'package:source_gen/source_gen.dart';

abstract class SelectableClassInformation {
  abstract final String? className;
  abstract final Set<FieldInformation> fields;
}

abstract class ISelectorCodeProducer {
  String produce(String className, Set<FieldInformation> fields);
}

class SelectorGenerator extends GeneratorForAnnotation<Selectable> {
  final ISelectorCodeProducer _producer;

  SelectorGenerator({
    required ISelectorCodeProducer producer,
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
        ? throw StateError('No class name found')
        : _producer.produce(className, information.fields);
  }
}
