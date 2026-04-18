---
trigger: always_on
---

# Core Directory Structure: APPLICATION

This document defines the structure and naming conventions for the `lib/core` directory.

## Directory Overview

The `lib/core` directory contains shared logic, utilities, constants, and global widgets used throughout the application.

### 1. `lib/core/auth/`
Handles authentication state and data sources.
- `model/`: Auth-specific models (e.g., `login_response.dart`).
- `auth_datasources.dart`: Local storage for tokens and user details.
- `auth_helper.dart`: Static helpers for auth status.
- `social_login_service.dart`: Integration with Google, Facebook, and Apple.

### 2. `lib/core/common_widgets/`
Generic, reusable UI components.
- `lable/`: Label-related widgets (e.g., `text_field_lable.dart`).

### 3. `lib/core/configs/`
Environment and system configurations.
- `api_config.dart`, `env_config.dart`, `web_config.dart`.

### 4. `lib/core/constants/`
Centralized app constants.
- `assets.dart`: Paths to images/icons.
- `dimens.dart`: Sizing and spacing constants.
- `messages.dart`: Static string messages and toast text.
- `routes.dart`: Navigation route names and `GoRouter` setup.

### 5. `lib/core/exceptions/`
Networking and API error handling.
- `api_result.dart`: Sealed class for success/failure.
- `network_exceptions.dart`: Logic for parsing Dio/HTTP errors.

### 6. `lib/core/models/`
Global models used by multiple modules.
- `product_offer_models.dart`, `file_view_response.dart`.

### 7. `lib/core/services/`
Global business logic services.
- `based_controller.dart`: Base class for all controllers.
- `service_locator.dart`: `GetIt` setup and registration.
- `deep_link_service.dart`, `http_cache.dart`, `image_cache_service.dart`.

### 8. `lib/core/theme_data/`
App styling and themes.
- `app_theme.dart`: Main `ThemeData`.
- `colour_scheme.dart`, `font.dart`, `textfield.dart`.
- `elevated_button_theme.dart`.

### 9. `lib/core/utils/`
Low-level helper functions.
- `app_log.dart`: Customized logging.
- `html_text_utils.dart`, `video_url_builder.dart`.

### 10. `lib/core/widgets/`
Global foundation widgets and loaders.
- `main_shell.dart`: Bottom navigation and tab state holder.
- `loaders/`: Specific loading animations (`circular_segment_loader.dart`).
- `shimmer_loader.dart`, `toast_message.dart`.

## Naming Conventions
- **Folders**: Lowercase snake_case (e.g., `common_widgets`).
- **Files**: Lowercase snake_case (e.g., `api_config.dart`).
- **Widgets**: Suffix with the widget type if appropriate (e.g., `_screen.dart`, `_loader.dart`, `_button.dart`).
