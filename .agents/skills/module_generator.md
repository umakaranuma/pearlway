# Skill: Module Generator

This skill helps the agent create a new feature module in FineMart following the Clean Architecture pattern.

## Workflow

1.  **Understand the Feature**: Get the module name (e.g., `wishlist`).
2.  **Creation Steps**:
    *   Create `lib/modules/[name]/infra/repositories`.
    *   Create `lib/modules/[name]/infra/models`.
    *   Create `lib/modules/[name]/presenters/controllers`.
    *   Create `lib/modules/[name]/presenters/screens`.
3.  **Controller Boilerplate**:
    ```dart
    import 'package:finemart/core/services/based_controller.dart';
    import '../infra/repositories/[name]_repository.dart';

    class [Name]Controller extends BaseController {
      final [Name]Repository _repository;
      [Name]Controller(this._repository);

      // Add logic here
    }
    ```
4.  **Repository Registration**:
    *   Add the new repository and controller to `lib/core/services/service_locator.dart`.
5.  **Route Registration**:
    *   Add the new route to `lib/core/constants/routes.dart`.
