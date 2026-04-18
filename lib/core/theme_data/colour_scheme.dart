import 'package:flutter/material.dart';

enum ColorType { dark, light, monochrome }

class CustomColourScheme {
  bool _isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  //Light Theme
  final Color _primaryColorL = const Color.fromARGB(255, 237, 28, 36);
  final Color _primaryTextL = const Color.fromARGB(255, 0, 0, 0);
  final Color _secondaryTextL = const Color.fromARGB(255, 52, 64, 84);
  final Color _backgroundL = const Color.fromARGB(255, 255, 255, 255);
  final Color _onBackgroundL = const Color.fromARGB(255, 189, 189, 192);
  final Color _primaryBorderL = const Color.fromARGB(255, 208, 213, 221);
  final Color _primaryButtonL = const Color.fromARGB(255, 77, 77, 77);
  final Color _errorColorL = Colors.red;

  // Dark Theme - for temporary purposes
  final Color _primaryColorD = const Color.fromARGB(255, 237, 28, 36);
  final Color _primaryTextD = const Color.fromARGB(255, 255, 255, 255);
  final Color _secondaryTextD = const Color.fromARGB(255, 200, 200, 200);
  final Color _backgroundD = const Color.fromARGB(255, 18, 18, 18);
  final Color _onBackgroundD = const Color.fromARGB(255, 120, 120, 120);
  final Color _primaryBorderD = const Color.fromARGB(255, 48, 48, 48);
  final Color _primaryButtonD = const Color.fromARGB(255, 150, 150, 150);
  final Color _errorColorD = Colors.red;

  // Getter methods to access colors
  Color getPrimaryColor(BuildContext context) {
    return _isDarkMode(context) ? _primaryColorD : _primaryColorL;
  }

  Color getPrimaryText(BuildContext context) {
    return _isDarkMode(context) ? _primaryTextD : _primaryTextL;
  }

  Color getSecondaryText(BuildContext context) {
    return _isDarkMode(context) ? _secondaryTextD : _secondaryTextL;
  }

  Color getBackground(BuildContext context) {
    return _isDarkMode(context) ? _backgroundD : _backgroundL;
  }

  Color getOnBackground(BuildContext context) {
    return _isDarkMode(context) ? _onBackgroundD : _onBackgroundL;
  }

  Color getPrimaryBorder(BuildContext context) {
    return _isDarkMode(context) ? _primaryBorderD : _primaryBorderL;
  }

  Color getPrimaryButton(BuildContext context) {
    return _isDarkMode(context) ? _primaryButtonD : _primaryButtonL;
  }

  Color getError(BuildContext context) {
    return _isDarkMode(context) ? _errorColorD : _errorColorL;
  }
}
