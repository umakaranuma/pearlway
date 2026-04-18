---
trigger: always_on
---

# Coding Standards: APPLICATION

This document outlines the coding conventions and best practices for the Pearlway Flutter project.

## Dart & Flutter
- **Naming Conventions**:
  - Classes: `PascalCase`
  - Variables/Methods: `camelCase`
  - Files: `snake_case.dart`
- **Widgets**:
  - Prefer `const` constructors where possible.
  - Break down large build methods into smaller private methods or separate widgets.
  - Use `Gap` widget for spacing between items in Rows and Columns.

## Imports
- Use package imports: `import 'package:Pearlway/...'`.
- Organize imports: Flutter/Dart first, then third-party packages, then local project files.

## State Management (BaseController)
- Always extend `BaseController` for logic classes.
- Use `startLoading()` and `stopLoading()` around async operations.
- Handle errors using `handleError(error)` or manual toast messages for specific cases.
- Avoid placing UI logic in controllers; keep them focused on data and state.

## Resource Management
- Use `assets/images` for static images.
- Use `assets/icons` for SVGs and custom icons.
- Add new assets to `pubspec.yaml`.

## Formatting
- Run `flutter format .` before committing.
- Use the project's `analysis_options.yaml` rules.
