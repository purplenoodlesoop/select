import 'package:code_builder/code_builder.dart';
import 'package:select/src/logic/selector_code_assembler.dart';
import 'package:select/src/model/field_information.dart';

abstract class ISelectorCodeProducer {
  String produce(String className, Set<FieldInformation> fields);
}

class CodeBuilderCodeProducer implements ISelectorCodeProducer {
  final DartEmitter _dartEmitter;
  final ISelectorCodeBuilderAssembler _assembler;

  const CodeBuilderCodeProducer({
    required DartEmitter dartEmitter,
    required ISelectorCodeBuilderAssembler assembler,
  })  : _dartEmitter = dartEmitter,
        _assembler = assembler;

  @override
  String produce(String className, Set<FieldInformation> fields) {
    final classDefinition = Class(
      (c) => c
        ..abstract = true
        ..name = _assembler.generatedClassName(className)
        ..constructors.add(_assembler.privateConstructor)
        ..methods.addAll(
          _assembler.selectorMethods(
            _assembler.modelParameter(className),
            fields,
          ),
        ),
    );

    return classDefinition.accept(_dartEmitter).toString();
  }
}
