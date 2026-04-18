import 'package:flutter/material.dart';

AppBarTheme appBarTheme(BuildContext context) {
  return const AppBarTheme(
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
