// ignore_for_file: avoid_print

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:select_annotation/select_annotation.dart';

part 'main.freezed.dart';
part 'main.select.dart';

@selectable
abstract class Named {
  String get firstName;
  String get lastName;
}

@selectable
@immutable
class Directions {
  final String description;

  const Directions({
    required this.description,
  });
}

@selectable
@immutable
class Address {
  final String street;
  final int number;
  final Directions directions;

  const Address({
    required this.street,
    required this.number,
    required this.directions,
  });
}

@selectable
@freezed
class User with _$User implements Named {
  const factory User({
    required String firstName,
    required String lastName,
    required Address address,
  }) = _User;
}

/// A helper extension that helps compose the selectors.
extension<A, B> on B Function(A) {
  C Function(A) d<C>(C Function(B c) selector) => (A a) => selector(this(a));
}

void selectableAnnotation() {
  const user = User(
    firstName: 'John',
    lastName: 'Doe',
    address: Address(
      street: 'Main Street',
      number: 123,
      directions: Directions(
        description: 'North',
      ),
    ),
  );

  print(Named$.firstName(user));
  print(Named$.lastName(user));

  print(Address$.street(user.address));
  print(Address$.number(user.address));

  final description =
      User$.address.d(Address$.directions).d(Directions$.description);

  final directions = const [user].map(description).toList();

  print(directions);
}

@matchable
enum AppTheme {
  light,
  dark,
  system,
}

void matchableAnnotation() {
  const currentTheme = AppTheme.light;

  final label = currentTheme.whenConst(
    light: 'To light',
    dark: 'To dark',
    system: 'To system',
  );
  print(label);

  currentTheme.when(
    light: () => print('Theme is light!'),
    dark: () => print('Theme is dark!'),
    system: () => print('Theme is system!'),
  );
}

void main() {
  selectableAnnotation();
  matchableAnnotation();
}
