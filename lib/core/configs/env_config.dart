import 'package:flutter/material.dart';

enum Mode { debug, demo, test, uat, live }

Mode currentMode =
    Mode.debug; // Change this based on your logic for determining the mode

class ApiConfig {
  final String candidateBaseUrl;
  final String idpBaseUrl;

  const ApiConfig({
    required this.candidateBaseUrl,
    required this.idpBaseUrl,
  });
}

class AppConfig {
  static final Map<Mode, ApiConfig> _apiConfigs = {
    Mode.debug: const ApiConfig(
      candidateBaseUrl: 'https://dev-admin.joboro.apptimus.lk/api/candidates',
      idpBaseUrl: 'https://idp-ui.utilities.apptimus.lk/idp-api/api/',
    ),
    Mode.demo: const ApiConfig(
      candidateBaseUrl: 'https://demo-api.empowerone.io/passenger/api/',
      idpBaseUrl: 'https://idp-ui.utilities.apptimus.lk/idp-api/api/',
    ),
    Mode.test: const ApiConfig(
      candidateBaseUrl: 'https://test-api.empowerone.io/passenger/api/',
      idpBaseUrl: 'https://idp-ui.utilities.apptimus.lk/idp-api/api/',
    ),
    Mode.uat: const ApiConfig(
      candidateBaseUrl: 'https://uat-api.empowerone.io/passenger/api/',
      idpBaseUrl: 'https://idp-ui.utilities.apptimus.lk/idp-api/api/',
    ),
    Mode.live: const ApiConfig(
      candidateBaseUrl: 'https://live-api.empowerone.io/passenger/api/',
      idpBaseUrl: 'https://idp-ui.utilities.apptimus.lk/idp-api/api/',
    ),
  };

  static ApiConfig get config {
    if (!_apiConfigs.containsKey(currentMode)) {
      throw Exception("🚨 Invalid Mode: $currentMode");
    }

    // Print debug logs to verify the correct values
    debugPrint("🔍 Fetching API Config for Mode: $currentMode");
    debugPrint(
        "✅ Correct IDP Base URL: ${_apiConfigs[currentMode]!.idpBaseUrl}");
    debugPrint(
        "✅ Correct Candidate Base URL: ${_apiConfigs[currentMode]!.candidateBaseUrl}");

    return _apiConfigs[currentMode]!;
  }
}
