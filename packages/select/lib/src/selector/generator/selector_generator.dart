import 'package:analyzer/dart/element/element.dart';
import 'package:select/src/core/generator/annotated_class_field_generator.dart';
import 'package:select/src/core/generator/code_producer.dart';
import 'package:select/src/selector/model/field_information.dart';
import 'package:select_annotation/select_annotation.dart';

class SelectorGenerator
    extends AnnotatedClassFieldGenerator<Selectable, FieldInformation> {
  SelectorGenerator({
    required CodeProducer<Set<FieldInformation>> producer,
  }) : super(producer: producer, allowedEntity: 'Class');

  @override
  Iterable<FieldInformation> extractFieldInfo(
    ClassElement thisElement,
  ) =>
      thisElement.fields
          .followedBy(
            thisElement.mixins.expand(
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
          );
}
