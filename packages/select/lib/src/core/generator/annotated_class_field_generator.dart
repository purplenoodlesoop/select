import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:select/src/core/error/enum_source_error.dart';
import 'package:select/src/core/generator/code_producer.dart';
import 'package:source_gen/source_gen.dart';

abstract class AnnotatedClassFieldGenerator<A, T>
    extends GeneratorForAnnotation<A> {
  final CodeProducer<Set<T>> _producer;
  final String _allowedEntity;

  AnnotatedClassFieldGenerator({
    required CodeProducer<Set<T>> producer,
    required String allowedEntity,
  })  : _producer = producer,
        _allowedEntity = allowedEntity;

  Iterable<T> extractFieldInfo(InterfaceElement thisElement);

  bool elementPredicate(InterfaceElement element) => true;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) =>
      element is! InterfaceElement || !elementPredicate(element)
          ? throw GenerationSourceError(
              annotation: T.toString().toLowerCase(),
              type: _allowedEntity,
              element: element,
            )
          : _producer.produce(
              element.displayName,
              extractFieldInfo(element.thisType.element).toSet(),
            );
}
