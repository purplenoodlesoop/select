import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:select/src/core/error/enum_source_error.dart';
import 'package:select/src/core/generator/code_producer.dart';
import 'package:select/src/selector/model/field_information.dart';
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

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) =>
      element is! ClassElement
          ? throw GenerationSourceError(
              annotation: 'selectable',
              type: 'Class',
              element: element,
            )
          : _producer.produce(
              element.displayName,
              element.thisType.element.fields
                  .followedBy(
                    element.thisType.element.mixins.expand(
                      (element) => element.element.fields,
                    ),
                  )
                  .map(
                    (field) => FieldInformation(
                      name: field.displayName,
                      type: field.type
                          .getDisplayString(withNullability: true)
                          .replaceAll('*', ''),
                    ),
                  )
                  .toSet(),
            );
}
