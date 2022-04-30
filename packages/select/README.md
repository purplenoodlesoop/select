# select

Code generation for selectors of fields that helps reduce repeating code.

## Index
- [Index](#index)
- [About](#about)
- [Motivation](#motivation)
- [Install](#install)
    - [Used packages](#used-packages)
    - [Pubspec](#pubspec)
- [Usage](#usage)
    - [Selectable class](#selectable-class)
    - [Examples](#examples)
        - [Iterable](#iterable)
        - [Stream](#stream)
        - [Provider](#provider)
        - [Selector builder](#selector-builder)


## About

***select*** helps generate selector methods for any class that can be used anywhere where you would use a selector-lambda. Only one annotation is used, and only one annotation is needed – every class annotated with `@selectable` would have selectors for all fields and all fields of applied mixins.

This package is compatible with the amazing [freezed](https://pub.dev/packages/freezed) code generator.

## Motivation

Selectors are widely used in Flutter and Dart. The most common places of usage are:
  - `Iterable` transformations and especially mappings
  - `Stream` transformations
  - The `select` method extension from [Provider](https://pub.dev/packages/provider)
  - Most of the selector-widgets, such as [BlocSelector](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocSelector-class.html)

Selector functions tend to be very repetitive, in the example function `(state) => state.field`, word state is repeated two times, and there are four symbols and two spaces. Overall, from 22 symbols, only 11 have a meaning, that is – `state.field`.

That's a great task for automation, and that's exactly what that package does. So instead of writing `(model) => model.field`, it is possible to write `Model$.field` with ***select***.

## Install

***select*** is a code-generation package, so the typical generator-annotation-builder setup is used.

### Used packages

- Generator – [select](https://pub.dev/packages/select)
- Annotations – [select_annotation](https://pub.dev/packages/select_annotation)
- Builder – [build_runner](https://pub.dev/packages/build_runner)

### Pubspec

And the `pubspec.yaml` should be extended as in following:

```yaml
dependencies:
  freezed_annotation: ^0.1.0

dev_dependencies:
  build_runner: #latest version
  select: ^0.1.0
```
## Usage

To generate selectors for a class, two following criteria should be met:
  1) The class is marked with the `@selectable` annotation.
  2) File with the class includes a generated code, `part model.select.dart;`.

### Selectable class

The following example demonstrates a minimal useful definition of the selectable class.

```dart
import 'package:select_annotation/select_annotation.dart';

part 'user.select.dart';

@selectable
class User {
  final String name;
  final int age;

  const User(this.name, this.age);
}
```

***selectable*** can (and probably should) be used in conjunction with the `freezed` generator and other annotations.

```dart
import 'package:select_annotation/select_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.select.dart';
part 'user.freezed.dart';

@selectable
@immutable
@freezed
class User with _$User {
  const factory User(String name, int age) = _User;
}
```

With the given `User` model, a class with two static methods will be generated.

```dart
abstract class User$ {
  User$._();

  static String name(User user) => user.name;
  static int age(User user) => user.age;
}
```

And that's it – those selectors can be used in any way, that a regular anonymous selector is used.

### Examples

Down below are listed the most commonly used use-cases for selectors and their versions implemented with ***selectable***.

#### Iterable

```dart
[User('Bob', 28)].map(User$.name);
```
#### Stream

```dart
Stream.fromIterable([User('Jade', 33)]).map(User$.age);
```
#### Provider

```dart
Widget build(BuildContext context) {
  final userName = context.select(User$.name);
  
  return ...;
}
```
#### Selector builder

```dart
Widget build(BuildContext context) => BlocSelector<UserBloc, UserModel, int>(
  selector: User$.age
  builder: ...,
);
```