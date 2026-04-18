import 'dart:convert';

import 'package:pearlway/core/exceptions/network_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseController {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  void startLoading() => isLoading.value = true;
  void stopLoading() => isLoading.value = false;

  void showToast(String message, {Color bgColor = Colors.red}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void handleError(
    NetworkExceptions error, {
    void Function(Map<String, String?> validationErrors)? onValidationErrors,
  }) {
    final response = NetworkExceptions.getErrorMessage(error);

    if (response.code == 417 && onValidationErrors != null) {
      try {
        final dynamic rawError = response.error;

        final Map<String, dynamic> errorData = rawError is String
            ? Map<String, dynamic>.from(jsonDecode(rawError))
            : rawError is Map<String, dynamic>
            ? rawError
            : {};

        // Extract all first errors from the map
        final Map<String, String?> validationMap = {};
        for (var entry in errorData.entries) {
          validationMap[entry.key] = getFirstError(errorData, entry.key);
        }

        onValidationErrors(validationMap);
      } catch (e) {
        debugPrint('Validation error parsing failed: $e');
      }
    } else {
      showToast(response.statusMessage ?? 'Unknown error');
    }
  }

  String? getFirstError(Map<String, dynamic> errors, String key) {
    final value = errors[key];
    return value is List && value.isNotEmpty ? value.first : null;
  }
}
