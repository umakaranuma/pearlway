# Navigation Guidelines: GoRouter

Pearlway uses `go_router` for declarative navigation.

## Route Definitions
- All routes are defined in `lib/core/constants/routes.dart`.
- Constants for route names should be defined in the `NavigationHelper` class.

## Usage
- **Pushing a route**: `context.push(NavigationHelper.someRoute)`
- **Going to a route (resetting stack)**: `context.go(NavigationHelper.homeRoute)`
- **Routes with parameters**: Use path parameters (e.g., `/product/:productId`) and access them via `state.pathParameters`.
- **Passing extra data**: Use the `extra` argument in `push` or `go`. Remember to cast it back to the expected type in the builder.

## Shell Navigation
- The app uses `StatefulShellRoute` for tab-based navigation (Home, Category, Cart, Account).
- The `MainShell` widget manages the bottom navigation bar and persistence of tab states.

## Guards & Redirects
- Authentication guards should be implemented in the `redirect` callback of `GoRoute`.
- Use `AuthHelper.isAuthenticated()` to check login status.
