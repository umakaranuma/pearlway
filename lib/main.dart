import 'package:pearlway/core/constants/routes.dart';
import 'package:pearlway/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pearlway/core/theme_data/app_theme.dart' as app_theme_mode;

final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.setup();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'Pearlway',
      theme: app_theme_mode.AppTheme.lightTheme(context),
      // darkTheme: app_theme_mode.AppTheme.darkTheme(context),
      routerConfig: NavigationHelper.router,
    );
  }
}
