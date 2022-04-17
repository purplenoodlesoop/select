import 'package:code_builder/code_builder.dart';
import 'package:meta/meta.dart' as meta;
import 'package:select/src/model/field_information.dart';

abstract class ISelectorCodeBuilder {
  abstract final Constructor privateConstructor;

  String generatedClassName(String originalName);

  Parameter modelParameter(String className);

  Iterable<Method> selectorMethods(
    Parameter modelParameter,
    Set<FieldInformation> fields,
  );
}

class SelectorCodeBuilder implements ISelectorCodeBuilder {
  @meta.literal
  const SelectorCodeBuilder();

  static final Constructor _privateConstructor = Constructor(
    (c) => c..name = '_',
  );

  @override
  Constructor get privateConstructor => _privateConstructor;

  @override
  String generatedClassName(String originalName) => '$originalName\$';

  @override
  Parameter modelParameter(String className) => Parameter(
        (p) => p
          ..type = Reference(className)
          ..name = 'model',
      );

  @override
  Iterable<Method> selectorMethods(
    Parameter modelParameter,
    Set<FieldInformation> fields,
  ) sync* {
    for (final field in fields) {
      final name = field.name;

      yield Method(
        (m) => m
          ..static = true
          ..returns = Reference(field.type)
          ..name = name
          ..requiredParameters.add(modelParameter)
          ..lambda = true
          ..body = Code('model.$name'),
      );
    }
  }
}
