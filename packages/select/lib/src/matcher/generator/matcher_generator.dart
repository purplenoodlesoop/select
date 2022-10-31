import 'package:analyzer/dart/element/element.dart';
import 'package:select/src/core/generator/annotated_class_field_generator.dart';
import 'package:select/src/core/generator/code_producer.dart';
import 'package:select_annotation/select_annotation.dart';

class MatcherGenerator extends AnnotatedClassFieldGenerator<Matchable, String> {
  MatcherGenerator({
    required CodeProducer<Set<String>> producer,
  }) : super(producer: producer, allowedEntity: 'Enum');

  @override
  bool elementPredicate(InterfaceElement element) => element is EnumElement;

  @override
  Iterable<String> extractFieldInfo(
    InterfaceElement thisElement,
  ) =>
      thisElement.fields
          .where((element) => element.isEnumConstant)
          .map((element) => element.displayName);
}
