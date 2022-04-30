# select

Code generation for selectors of fields that helps reduce repeating code.

## Index
- [Index](#index)
- [About](#about)
- [Motivation](#motivation)
- [Install](#install)
- [Usage](#usage)


## About

***select*** helps generate selector methods for any class that can be used anywhere where you would use a selector-lambda. Only one annotation is used, and only one annotation is needed – every class annotated with `@select` would has selectors for all fields and all fields of applied mixins.

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

***select*** is a code-generation package, so the typical generator-annotation-builder setup is used:

- Generator – [select](https://pub.dev/packages/select)
- Annotations – [select_annotation](https://pub.dev/packages/select_annotation)
- Builder – [build_runner](https://pub.dev/packages/build_runner)

And the `pubspec.yaml` should be extended as in following:

```yaml
dependencies:
  freezed_annotation: ^0.1.0

dev_dependencies:
  build_runner: #latest version
  select: ^0.1.0
```
## Usage


