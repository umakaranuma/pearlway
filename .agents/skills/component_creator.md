# Skill: Component Creator

Guidelines for creating reusable UI components in `lib/core/common_widgets`.

## Principles
- **Reusability**: Components should be generic enough to be used in multiple modules.
- **Theming**: Use `Theme.of(context)` for colors and text styles to ensure consistency with the app's theme.
- **Composition**: Prefer composition over inheritance.
- **Documentation**: Add docstrings to public parameters.

## Patterns
- **Standard UI Elements**: Buttons, Input Fields, Custom Cards.
- **Spacing**: Use `Gap` instead of `SizedBox` for internal padding/spacing for better readability.
- **Icons**: Prefer SVG icons from `assets/icons` using `SvgPicture.asset`.

## Example Structure
```dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
```
