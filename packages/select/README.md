# select

Code generation for selectors of fields that helps reduce repeating code.

## Index
- [Index](#index)
- [About](#about)
- [Motivation](#motivation)
- [Install](#install)
- [Usage](#usage)


## About

`select` helps generate selector methods for any class that can be used anywhere where you would use a selector-lambda. Only one annotation is used, and only one annotation is needed – every class annotated with `@select` would has selectors for all fields and all fields of applied mixins.

This package is compatible with the amazing [freezed](https://pub.dev/packages/freezed) code generator.

## Motivation

Selectors are widely used in Flutter and Dart. The most common places of usage are:
  - `Iterable` transformations and especially mappings
  - `Stream` transformations
  - The `select` method extension from [Provider](https://pub.dev/packages/provider)
  - Most of the selector-widgets, such as [BlocSelector](https://pub.dev/documentation/flutter_bloc/latest/flutter_bloc/BlocSelector-class.html)



## Install
## Usage


