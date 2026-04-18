import 'package:pearlway/core/theme_data/font.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData getElevatedButtonThemeData(BuildContext context) {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((state) {
        if (state.contains(WidgetState.pressed)) {
          return colorScheme.getSecondaryText(context); // Pressed state color
        }
        return colorScheme.getPrimaryButton(context); // Default color
      }),
      textStyle: WidgetStatePropertyAll(buildTextTheme(context).labelMedium),
      fixedSize: const WidgetStatePropertyAll(
        Size.fromHeight(48), // Button height
      ),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          side: const BorderSide(
            color: Color(0xffD0D5DD), // Border color
            width: 1, // Border thickness
          ),
        ),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 14, horizontal: 20), // Button padding
      ),
      elevation: WidgetStateProperty.resolveWith<double>((states) {
        if (states.contains(WidgetState.pressed)) {
          return 0; // Remove shadow when pressed
        }
        return 0; // Default elevation
      }),
      // shadowColor: const WidgetStatePropertyAll(
      //   Colors.black38, // Shadow color
      // ),
    ),
  );
}
