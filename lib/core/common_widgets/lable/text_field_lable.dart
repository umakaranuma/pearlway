import 'package:flutter/material.dart';

class TextFieldLable extends StatefulWidget {
  final String label;
  const TextFieldLable({super.key, required this.label});

  @override
  State<TextFieldLable> createState() => _TextFieldLableState();
}

class _TextFieldLableState extends State<TextFieldLable> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}
