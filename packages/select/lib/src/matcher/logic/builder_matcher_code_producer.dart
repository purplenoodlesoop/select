import 'package:code_builder/code_builder.dart';
import 'package:select/src/core/logic/builder_code_producer.dart';

class BuilderMatcherCodeProducer extends BuilderCodeProducer<Set<String>> {
  BuilderMatcherCodeProducer({
    required DartEmitter emitter,
  }) : super(emitter);

  static const Reference _tRef = Reference('T');
  static const Reference _tThunkRef = Reference('T Function()');
  static const Reference _tRefNullable = Reference('T?');
  static const Reference _tThunkRefNullable = Reference('T Function()?');

  static String _extensionName(String name) => '\$${name}MatcherExtension';

  static Iterable<Parameter> _parameters(
    Set<String> fields,
    Reference type,
    bool isRequired,
  ) =>
      fields.map(
        (field) => Parameter(
          (p) => p
            ..type = type
            ..name = field
            ..named = true
            ..required = isRequired,
        ),
      );

  static Code _body(String enumName, Set<String> fields, String resolve) {
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
        ..write(resolve)
        ..writeln(';');
    }
    buffer.write('}');

    return Code(buffer.toString());
  }

  static Method Function(
    String enumName,
    Set<String> info,
  ) _matcherMethod({
    required String name,
    required Reference parameterType,
    String resolve = '',
    required bool areParametersRequired,
  }) =>
      (enumName, info) => Method(
            (b) => b
              ..types.add(_tRef)
              ..returns = areParametersRequired ? _tRef : _tRefNullable
              ..name = name
              ..optionalParameters.addAll(
                _parameters(info, parameterType, areParametersRequired),
              )
              ..body = _body(enumName, info, resolve),
          );

  @override
  Extension spec(String className, Set<String> info) => Extension(
        (b) => b
          ..name = _extensionName(className)
          ..on = Reference(className)
          ..methods.addAll(
            [
              _matcherMethod(
                name: 'when',
                parameterType: _tThunkRef,
                resolve: '()',
                areParametersRequired: true,
              ),
              _matcherMethod(
                name: 'whenConst',
                parameterType: _tRef,
                areParametersRequired: true,
              ),
              _matcherMethod(
                name: 'whenOrNull',
                parameterType: _tThunkRefNullable,
                resolve: '?.call()',
                areParametersRequired: false,
              ),
              _matcherMethod(
                name: 'whenConstOrNull',
                parameterType: _tRefNullable,
                areParametersRequired: false,
              ),
            ].map((method) => method(className, info)),
          ),
      );
}
