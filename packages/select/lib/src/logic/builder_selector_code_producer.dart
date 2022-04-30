import 'package:code_builder/code_builder.dart';
import 'package:select/src/generator/selector_generator.dart';
import 'package:select/src/model/field_information.dart';

class BuilderSelectorCodeProducer implements ISelectorCodeProducer {
  final DartEmitter _dartEmitter;

  const BuilderSelectorCodeProducer({
    required DartEmitter dartEmitter,
  }) : _dartEmitter = dartEmitter;

  static final Constructor _privateConstructor = Constructor(
    (c) => c..name = '_',
  );

  String _generatedClassName(String originalName) => '$originalName\$';

  Parameter _modelParameter(String className) => Parameter(
        (p) => p
          ..type = Reference(className)
          ..name = 'model',
      );

  Iterable<Method> _selectorMethods(
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

  Class _class(String className, Set<FieldInformation> fields) => Class(
        (c) => c
          ..abstract = true
          ..name = _generatedClassName(className)
          ..constructors.add(_privateConstructor)
          ..methods.addAll(
            _selectorMethods(
              _modelParameter(className),
              fields,
            ),
          ),
      );

  @override
  String produce(
    String className,
    Set<FieldInformation> fields,
  ) =>
      _class(className, fields).accept(_dartEmitter).toString();
}
