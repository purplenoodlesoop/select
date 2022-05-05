import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

class GenerationSourceError extends InvalidGenerationSourceError {
  GenerationSourceError({
    required String annotation,
    required String type,
    required Element element,
  }) : super(
          '@$annotation can only be used on $type',
          element: element,
        );
}
