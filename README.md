# Pearlway

Pearlway is a comprehensive platform connecting tourists with local hosts in Sri Lanka for accommodations, vehicle rentals, guided experiences, and tourist spot discoveries.

## Project Scope
The platform aims to provide two primary interfaces:
- **Tourist App**: Allows users to explore and book stays, rent vehicles (cars, tuk-tuks, bikes), discover local experiences, manage trips, and view interactive maps.
- **Host Dashboard**: Provides property owners and service providers with an administration portal to manage their listings, calendar, bookings, earnings, and vehicle inventory.

## Development Guidelines

**IMPORTANT:** All development must strictly adhere to the agentic instructions provided in the **`.agents/rules`** directory. 

Before making architectural decisions or writing new features, you must review and apply:
- **Architecture (`.agents/rules/architecture.md`)**: Ensures the project follows the Modified Clean Architecture with a strict separation between `lib/core` and feature-based modules (`lib/modules/[feature]`).
- **Coding Standards (`.agents/rules/coding_standards.md`)**: Details conventions for error handling, generic UI usage, and state management via `BaseController`.
- **Core Structure (`.agents/rules/core_structure.md`)**: Instructions detailing the global configurations, services, theme injection, routing files, and models that live in `lib/core`.
- **Navigation (`.agents/rules/navigation.md`)**: Detailed rules on utilizing `go_router` for route definition, parsing, and page redirects.

Always rely on these documentation files as your primary source of truth to maintain structural integrity.

## Design Reference
Refer to the `.docs/design_system/` directory for visual components and high-fidelity mockups outlining the UI flows.
