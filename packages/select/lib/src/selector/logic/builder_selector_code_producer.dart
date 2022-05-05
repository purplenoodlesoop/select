import 'package:code_builder/code_builder.dart';
import 'package:select/src/core/logic/builder_code_producer.dart';
import 'package:select/src/selector/model/field_information.dart';

class BuilderSelectorCodeProducer
    extends BuilderCodeProducer<Set<FieldInformation>> {
  BuilderSelectorCodeProducer({
    required DartEmitter dartEmitter,
  }) : super(dartEmitter);

  static final Constructor _privateConstructor = Constructor(
    (c) => c..name = '_',
  );

  static String _generatedClassName(String originalName) => '$originalName\$';

  static Parameter _modelParameter(String className) => Parameter(
        (p) => p
          ..type = Reference(className)
          ..name = 'model',
      );

  static Iterable<Method> _selectorMethods(
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

  @override
  Class spec(String className, Set<FieldInformation> info) => Class(
        (c) => c
          ..abstract = true
          ..name = _generatedClassName(className)
          ..constructors.add(_privateConstructor)
          ..methods.addAll(
            _selectorMethods(
              _modelParameter(className),
              info,
            ),
          ),
      );
}
