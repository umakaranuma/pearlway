import 'package:pearlway/core/auth/auth_datasources.dart';
// Removes api_config.dart and env_config.dart
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static Future<void> setup() async {
    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);
    getIt.registerSingleton<AuthDataSources>(AuthDataSources());
  }
}
