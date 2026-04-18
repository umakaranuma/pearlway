import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pearlway/modules/tourist/presenters/screens/explore_screen.dart';
import 'package:pearlway/modules/tourist/presenters/screens/messages_screen.dart';
import 'package:pearlway/modules/tourist/presenters/screens/places_screen.dart';
import 'package:pearlway/modules/tourist/presenters/screens/profile_screen.dart';
import 'package:pearlway/modules/tourist/presenters/screens/search_screen.dart';
import 'package:pearlway/modules/tourist/presenters/screens/tourist_shell.dart';
import 'package:pearlway/modules/tourist/presenters/screens/trips_screen.dart';

class NavigationHelper {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Splash
  static const String splashPath = '/';

  // Tourist Paths
  static const String explorePath = '/explore';
  static const String searchPath = 'search'; // relative to explore
  static const String placesPath = '/places';
  static const String tripsPath = '/trips';
  static const String messagesPath = '/messages';
  static const String profilePath = '/profile';

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: explorePath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return TouristShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: explorePath,
                builder: (context, state) => const ExploreScreen(),
                routes: [
                  GoRoute(
                    path: searchPath,
                    builder: (context, state) => const SearchScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: placesPath,
                builder: (context, state) => const PlacesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: tripsPath,
                builder: (context, state) => const TripsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: messagesPath,
                builder: (context, state) => const MessagesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: profilePath,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
