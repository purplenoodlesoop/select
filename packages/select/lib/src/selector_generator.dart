import 'package:build/build.dart';
import 'package:select/src/field_accumulator_visitor.dart';
import 'package:select_annotation/select_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'package:analyzer/dart/element/element.dart';

class SelectorGenerator extends GeneratorForAnnotation<Selectable> {
  SelectableClassInformation _accumulateInformation(Element element) {
    final visitor = FieldAccumulatorVisitor();

    element.visitChildren(visitor);

    return visitor;
  }

  void _writeDeclaration(StringBuffer buffer, String className) {
    buffer
      ..write('abstract class ')
      ..write(className)
      ..write('\$ ')
      ..writeln('{ ')
      ..write(className)
      ..writeln('\$._();');
  }

  void _writeFields(
    StringBuffer buffer,
    Set<FieldInformation> fields,
    String className,
  ) {
    for (final field in fields) {
      buffer
        ..write('static ')
        ..write(field.type)
        ..write(' ')
        ..write(field.name)
        ..write('(')
        ..write(className)
        ..write(' model) => model.')
        ..write(field.name)
        ..writeln(';');
    }
  }

  void _closeClass(StringBuffer buffer) {
    buffer.writeln('}');
  }

  void _writeSelector(
    StringBuffer output,
    Set<FieldInformation> fields,
    String className,
  ) {
    _writeDeclaration(output, className);
    _writeFields(output, fields, className);
    _closeClass(output);
  }

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final information = _accumulateInformation(element);

    final className = information.className;
    if (className == null) throw StateError('No class name found');

    final output = StringBuffer();

    _writeSelector(output, information.fields, className);

    return output.toString();
  }
}
