import 'dart:collection';

import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:select/src/field_information.dart';
import 'package:select/src/selector_generator.dart';

extension on String {
  String sterilize() => replaceAll('*', '').replaceAll('_\$', '');
}

class FieldAccumulatorVisitor extends SimpleElementVisitor<void>
    implements SelectableClassInformation {
  String? _className;
  final Set<FieldInformation> _fields = {};

  @override
  String? get className => _className;

  @override
  Set<FieldInformation> get fields => UnmodifiableSetView(_fields);

  @override
  void visitConstructorElement(ConstructorElement element) {
    _className = element.type.returnType.toString().sterilize();
  }

  @override
  void visitFieldElement(FieldElement element) {
    final name = element.name;
    final type = element.type.toString();

    if (!type.contains('\$') && name != 'hashCode') {
      final fieldInformation = FieldInformation(
        name: name,
        type: type.sterilize(),
      );

      _fields.add(fieldInformation);
    }
  }
}
