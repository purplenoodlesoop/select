# select

Code generation for selectors of class fields and enum cases that helps reduce repetitive code.

## Index
- [Index](#index)
- [About](#about)
- [Motivation](#motivation)
  - [Classes](#classes)
  - [Enums](#enums)
- [Install](#install)
    - [Used packages](#used-packages)
    - [Pubspec](#pubspec)
- [Usage](#usage)
    - [Selectable class](#selectable-class)
    - [Matchable enum](#matchable-enum)
    - [Examples](#examples)
        - [Iterable](#iterable)
        - [Stream](#stream)
        - [Provider](#provider)
        - [Selector builder](#selector-builder)
        - [Icons](#icons)
        - [Widget mappings](#widget-mappings)


## About

***select*** helps generate selector methods for any class that can be used anywhere where you would use a selector-lambda and pattern-matching for Enums that can replace switch/case to be less wordy.

This package is compatible with the amazing [freezed](https://pub.dev/packages/freezed) code generator.

## Motivation

Writing less code without a meaning helps a developer to focus on writing actual code. ***selectable*** helps you focus on writing business logic instead of distracting on things that can be automatically derived.

### Classes

Selectors are widely used in Flutter and Dart. The most common places of usage are:
  - `Iterable` transformations and especially mappings
  - `Stream` transformations
  - The `select` method extension from [Provider](https://pub.dev/packages/provider)
  - Most of the selector-widgets, such as [BlocSelector](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocSelector-class.html)

Selector functions tend to be very repetitive, in the example function `(state) => state.field`, word state is repeated two times, and there are four symbols and two spaces. Overall, from 22 symbols, only 11 have a meaning, that is – `state.field`.

That's a great task for automation, and that's exactly what that package does. So instead of writing `(model) => model.field`, it is possible to write `Model$.field` with ***select***.

### Enums

Similarly, Enums suffer from the same issues of demanding to write some code that doesn't has any meaning at all. Consider the following example:

```dart
switch (theme) {
  case AppTheme.light:
    print('Light!');
    break;
  case AppTheme.dark:
    print('Dark!');
    break;
  case AppTheme.system:
    print('System!');
    break;
}
```

From 138 symbols, only a fraction actually contains any meaning. ***selectable*** allows to write code with the same meaning, but a lot more compact:

```dart
theme.when(
  light: () => print('Light!'),
  dark: () => print('Dark!'),
  system: () => print('System!'),
);
```

That's almost twice as little symbols with a lot more meaning.

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
  select_annotation: #latest version

dev_dependencies:
  build_runner: #latest version
  select: #latest version
```
## Usage

To generate selectors, two following criteria should be met:
  1) The class is marked with the `@selectable` annotation or the enum is marked with the `@matchable` annotation.
  2) File with the class/enum includes a generated code, `part model.select.dart;`.

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

### Matchable enum

To generate matching extensions for a enum, besides including the generated code through `part` directive, it must be annotated with the `@matchable` annotation:

```dart
@matchable
enum AppTheme {
  light,
  dark,
  system,
}
```

The following enum would generate an extension with two methods:

```dart
extension $AppThemeMatcherExtension on AppTheme {
  T when<T>({required T Function() light, required T Function() dark, required T Function() system}) {
    switch (this) {
      case AppTheme.light:
        return light();
      case AppTheme.dark:
        return dark();
      case AppTheme.system:
        return system();
    }
  }

  T whenConst<T>({required T light, required T dark, required T system}) {
    switch (this) {
      case AppTheme.light:
        return light;
      case AppTheme.dark:
        return dark;
      case AppTheme.system:
        return system;
    }
  }
}
```

The first one strictly replaces the switch/case, by allowing to execute only the matched case, accepting only the description of the values or actions, while the second one acts more as a type hash table, creating everything in advance and, as the name suggests, should be used with constant values.

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

#### Icons

```dart
Icon(
  theme.whenConst(
    light: Icons.wb_sunny,
    dark: Icons.brightness_3,
    system: Icons.brightness_auto,
  ),
);
```

#### Widget mappings

```dart
Widget build(BuildContext context) => formStep.when(
    name: () => NameForm(initial: name),
    age: () => AgeForm(minimumAge: widget.minimumAge),
    email: () => const EmailForm(),
  );
```