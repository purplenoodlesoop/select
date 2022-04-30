// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

part of 'main.dart';

// **************************************************************************
// SelectorGenerator
// **************************************************************************

abstract class Named$ {
  Named$._();

  static String firstName(Named model) => model.firstName;
  static String lastName(Named model) => model.lastName;
}

abstract class Directions$ {
  Directions$._();

  static String description(Directions model) => model.description;
}

abstract class Address$ {
  Address$._();

  static String street(Address model) => model.street;
  static int number(Address model) => model.number;
  static Directions directions(Address model) => model.directions;
}

abstract class User$ {
  User$._();

  static String firstName(User model) => model.firstName;
  static String lastName(User model) => model.lastName;
  static Address address(User model) => model.address;
  static $UserCopyWith<User> copyWith(User model) => model.copyWith;
}
