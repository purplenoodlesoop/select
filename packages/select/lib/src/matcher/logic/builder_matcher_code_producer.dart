import 'package:code_builder/code_builder.dart';
import 'package:select/src/core/generator/builder_code_producer.dart';

class BuilderMatcherCodeProducer extends BuilderCodeProducer<Set<String>> {
  BuilderMatcherCodeProducer({
    required DartEmitter emitter,
  }) : super(emitter);

  static const Reference _tRef = Reference('T');
  static const Reference _tThunkRef = Reference('T Function()');

  static String _extensionName(String name) => '\$${name}MatcherExtension';

  static Iterable<Parameter> _parameters(Set<String> fields) => fields.map(
        (field) => Parameter(
          (p) => p
            ..type = _tThunkRef
            ..name = field
            ..named = true
            ..required = true,
        ),
      );

  static Code _body(String enumName, Set<String> fields) {
    final buffer = StringBuffer()..writeln('switch (this) {');

    for (final field in fields) {
      buffer
        ..write('case ')
        ..write(enumName)
        ..write('.')
        ..write(field)
        ..writeln(':')
        ..write('return ')
        ..write(field)
        ..writeln('();');
    }
    buffer.write('}');

    return Code(buffer.toString());
  }

  static Method _matcherMethod(String enumName, Set<String> info) => Method(
        (b) => b
          ..types.add(_tRef)
          ..returns = _tRef
          ..name = 'when'
          ..optionalParameters.addAll(
            _parameters(info),
          )
          ..body = _body(enumName, info),
      );

  @override
  Extension spec(String className, Set<String> info) => Extension(
        (b) => b
          ..name = _extensionName(className)
          ..on = Reference(className)
          ..methods.add(
            _matcherMethod(className, info),
          ),
      );
}
