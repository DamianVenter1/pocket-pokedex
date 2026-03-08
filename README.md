# Pocket Pokedex 

## Setup Instructions

### Prerequisites
- Flutter SDK (managed via FVM)
- Dart SDK
- Android Studio / Xcode (for emulators)

### Run the App
```bash
fvm flutter run
```

### Install on Android device
APK provided in root folder

## Tech Stack

- Flutter v3.41.0
- Cubit (used for state management using flutter_bloc)
- rxdart (Reactive streams for services)
- go_router (App routing)
- freezed + build_runner (Class code generation)
- dio (HTTP Client)
- firebase_auth (Authentication using Firebase)\
** NOTE: I know it's bad practice to push firebase.json & google-services.json, just did it in this case to hopefully make testing easier

---

## Architectural Decisions

### Clean Architecture

The project follows **Clean Architecture** principles with clear separation of concerns.
**Rationale:** Clean Architecture provides testability, maintainability, and clear boundaries between layers. Each layer has a single responsibility and dependencies flow inward.

### Service Layer with Streams

Services use **BehaviorSubject** (rxdart) for reactive state.
**Rationale:**
- Allows multiple widgets to react to changes
- Services can be listened to from anywhere
- Maintains single source of truth

### Routing with GoRouter

Routes are defined as classes with code generation.
**Rationale:**
- Compile-time route safety
- Type-safe parameters
- Centralized route definitions
- Easy deep linking support

### Per-User Local Storage

Favorites are stored per user.
**Rationale:**
- Supports multiple users on same device
- Data isolation between accounts
- Persists across app restarts

### Infinite Scroll Pagination

Home page uses infinite scroll.
- Loads 20 items initially
- Detects scroll position near bottom (within 200px)
- Automatically fetches next batch of 20
- Shows loading indicator at bottom while fetching

**Rationale:**
- Better mobile UX
- Seamless browsing experience
