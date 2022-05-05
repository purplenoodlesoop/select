import 'package:analyzer/dart/element/element.dart';

Set<String> parseEnumFields(ClassElement element) =>
    element.thisType.element.fields
        .where((element) => element.isEnumConstant)
        .map((element) => element.displayName)
        .toSet();
