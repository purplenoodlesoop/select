import 'dart:collection';

import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

extension on String {
  String sterilize() => replaceAll('*', '').replaceAll('_\$', '');
}

class FieldInformation {
  final String name;
  final String type;

  const FieldInformation({
    required this.name,
    required this.type,
  });

  @override
  String toString() => '$type $name';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FieldInformation && name == other.name && type == other.type);

  @override
  int get hashCode => name.hashCode ^ type.hashCode;
}

abstract class SelectableClassInformation {
  String? get className;
  Set<FieldInformation> get fields;
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
