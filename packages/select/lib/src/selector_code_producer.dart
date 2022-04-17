import 'package:code_builder/code_builder.dart';
import 'package:select/src/field_information.dart';
import 'package:select/src/selector_code_builder.dart';

abstract class ISelectorCodeProducer {
  String produce(String className, Set<FieldInformation> fields);
}

class CodeBuilderCodeProducer implements ISelectorCodeProducer {
  final DartEmitter _dartEmitter;
  final SelectorCodeBuilder _builder;

  const CodeBuilderCodeProducer({
    required DartEmitter dartEmitter,
    required SelectorCodeBuilder builder,
  })  : _dartEmitter = dartEmitter,
        _builder = builder;

  @override
  String produce(String className, Set<FieldInformation> fields) {
    final classDefinition = Class(
      (c) => c
        ..abstract = true
        ..name = _builder.generatedClassName(className)
        ..constructors.add(_builder.privateConstructor)
        ..methods.addAll(
          _builder.selectorMethods(
            _builder.modelParameter(className),
            fields,
          ),
        ),
    );

    return classDefinition.accept(_dartEmitter).toString();
  }
}
