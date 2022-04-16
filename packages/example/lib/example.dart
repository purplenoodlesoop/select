import 'package:select_annotation/select_annotation.dart';

part 'example.select.dart';

@selectable
class Whole {
  final Part part;

  const Whole(this.part);
}

@selectable
class Part {
  final String value;

  const Part(this.value);
}

void main() {
  final values = const [Whole(Part('foo')), Whole(Part('bar'))]
      .map(Whole$.part)
      .map(Part$.value);

  print(values);
}
