---
trigger: always_on
---

# Architecture Guidelines: APPLICATION

This document outlines the architectural patterns and state management strategies used in the Pearlway application.

## Overview
The project follows a **Modified Clean Architecture** pattern organized by features (modules).

## Directory Structure
- `lib/core`: Contains cross-cutting concerns, common widgets, services, and configurations. Detailed structure is defined in [core_structure.md](file:///e:/applications/pearlway/.agents/rules/core_structure.md).
- `lib/modules`: Contains feature-based modules. Each feature is isolated with its own infrastructure and presentation layers.
  - `lib/modules/[feature_name]/infra`: Data layer (Models, Repositories).
  - `lib/modules/[feature_name]/presenters`: UI layer (Screens, Controllers).
    - `presenters/controllers`: State management logic extending `BaseController`.
    - `presenters/screens`: Flutter widgets and UI components.

## State Management
- **Controllers**: Each feature should have a controller that extends `BaseController`.
- **Loading State**: Use the `isLoading` ValueNotifier provided by `BaseController` to manage loading UI.
- **Dependency Injection**: Use `getIt` (Service Locator) to inject repositories and controllers. 
  - Register services in `lib/core/services/service_locator.dart`.

## Services
- **Networking**: use `Dio` for API calls. Error handling is centralized in `NetworkExceptions`.
- **Navigation**: Use `GoRouter`. Route definitions are in `lib/core/constants/routes.dart`.
- **Storage**: Use `flutter_secure_storage` for sensitive data and `shared_preferences` for non-sensitive local settings.

## Data Handling
- Use the `Result` pattern (success/failure) for repository methods to ensure robust error handling in controllers.
- Models should have `fromJson` and `toJson` methods, preferably generated or following the project's manual pattern.
