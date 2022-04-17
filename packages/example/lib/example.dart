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
  const source = [Whole(Part('foo')), Whole(Part('bar'))];

  final bad = source.map((whole) => whole.part).map((part) => part.value);

  final good = source.map(Whole$.part).map(Part$.value);

  [bad, good];
}
