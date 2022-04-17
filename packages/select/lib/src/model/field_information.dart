import 'package:meta/meta.dart';

@immutable
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
