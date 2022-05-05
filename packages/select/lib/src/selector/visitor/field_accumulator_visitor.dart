import 'dart:collection';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:meta/meta.dart';
import 'package:select/src/selector/generator/selector_generator.dart';
import 'package:select/src/selector/model/field_information.dart';

extension on DartType {
  String stringified() => toString().replaceAll('*', '');
}

class FieldAccumulatorVisitor extends SimpleElementVisitor<void>
    implements SelectableClassInformation {
  String? _className;
  final Set<FieldInformation> _fields = {};

  @override
  String? get className => _className;

  @override
  Set<FieldInformation> get fields => UnmodifiableSetView(_fields);

  void _assignClassName(ConstructorElement element) {
    _className = element.type.returnType.stringified();
  }

  void _assignMixinFields(ConstructorElement element) {
    element.enclosingElement.mixins
        .map((mixin) => mixin.element)
        .expand((element) => element.fields)
        .forEach(visitFieldElement);
  }

  @override
  @mustCallSuper
  void visitFieldElement(FieldElement element) {
    final fieldInformation = FieldInformation(
      name: element.name,
      type: element.type.stringified(),
    );

    _fields.add(fieldInformation);
  }

  @override
  @mustCallSuper
  void visitConstructorElement(ConstructorElement element) {
    _assignClassName(element);
    _assignMixinFields(element);
  }
}
