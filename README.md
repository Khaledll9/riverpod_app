<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.29+-02569B?logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Dart-3.8+-0175C2?logo=dart&logoColor=white" alt="Dart">
  <img src="https://img.shields.io/badge/Riverpod-2.6-764ABC?logo=flutter&logoColor=white" alt="Riverpod">
  <img src="https://img.shields.io/badge/Freezed-3.1-16213E" alt="Freezed">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License">
  <img src="https://img.shields.io/badge/PRs-welcome-brightgreen" alt="PRs Welcome">
</p>

<br />

<p align="center">
  <img src="https://via.placeholder.com/1200x400/1a1a2e/e0e0e0?text=riverpod_app" alt="App Banner" width="100%">
</p>

<h1 align="center">riverpod_app</h1>
<p align="center">
  <em>A comprehensive, hands-on Flutter playground that demystifies every Riverpod provider pattern — from hand-written providers to codegen, Freezed models, Dio networking, and beyond.</em>
</p>

---

## About The Project

State management remains the most debated architectural decision in Flutter development. **riverpod_app** cuts through the noise by providing a single, live-coded reference application that demonstrates every major Riverpod provider pattern side by side.

Designed for **intermediate-to-advanced Flutter developers**, this project serves three audiences:

- **Engineers** evaluating Riverpod for production — see real-world patterns like `NotifierProvider`, `FutureProvider`, `StreamProvider`, `family`/`autoDispose` modifiers, and codegen with `riverpod_generator`.
- **Hiring managers** assessing candidates — the codebase reflects modern Dart idioms, Freezed data classes, Dio-based networking, and a clean feature-first structure.
- **Open-source contributors** — each provider pattern lives in its own directory with minimal coupling, making it trivial to extend, refactor, or port patterns into production apps.

---

## Tech Stack & Core Ecosystem

| Technology | Purpose In This Project |
|---|---|
| **Flutter** (SDK `>=3.29`) | Cross-platform UI framework — renders all demo pages |
| **Dart** (`^3.8.1`) | Strongly-typed language — enforces sound null safety |
| **flutter_riverpod** (`^2.6.1`) | Core state-management runtime — `Provider`, `StateProvider`, `StateNotifierProvider`, `NotifierProvider`, `FutureProvider`, `StreamProvider` |
| **riverpod_annotation** + **riverpod_generator** | Compile-time codegen for `@riverpod`-annotated providers — eliminates boilerplate |
| **freezed_annotation** + **freezed** | Immutable data classes with sealed unions, `copyWith`, JSON serialization |
| **json_annotation** + **json_serializable** | Declarative JSON mapping for Freezed models |
| **Dio** (`^5.9.0`) | HTTP client — fetches `randomuser.me` API data in the FutureProvider demo |
| **device_preview** (`^1.3.1`) | Dev-time device frame & locale preview — wraps the entire app |
| **custom_lint** + **riverpod_lint** | Riverpod-specific lint rules — catches misused providers, missing modifiers |
| **flutter_lints** | Baseline linting — extended from `package:flutter_lints/flutter.yaml` |
| **build_runner** | Code-generation orchestrator — runs Freezed + Riverpod codegen pipelines |

---

## Key Architecture

The project follows a **feature-first** layout where each Riverpod provider pattern occupies its own directory. Data flows through a clean unidirectional cycle:

```
 ┌─────────────────────────────────────────────────┐
 │                   UI Layer                       │
 │  ConsumerWidget / ConsumerStatefulWidget         │
 │  (ref.watch / ref.read / ref.listen)             │
 └────────────┬──────────────────────┬─────────────┘
              │ reads                │ invalidates
              ▼                      ▼
 ┌─────────────────────────────────────────────────┐
 │               Provider Layer                    │
 │  @riverpod / NotifierProvider / FutureProvider  │
 │  StateProvider / StreamProvider / Family         │
 └────────────┬──────────────────────┬─────────────┘
              │ calls                │ creates
              ▼                      ▼
 ┌─────────────────────┐  ┌──────────────────────┐
 │  Service Layer      │  │  Data Layer          │
 │  Dio HTTP client    │  │  Freezed models      │
 │  (user_provider)    │  │  JSON serialization  │
 └─────────────────────┘  └──────────────────────┘
```

**Key design decisions:**

- **Every provider pattern is independently navigable** — each demo page is a standalone screen reached from the `HomePage` hub.
- **Codegen and hand-written providers coexist** — `lib/provider_setProvider/` shows classic hand-written providers, while `lib/basic/` and `lib/future_provider/` demonstrate the `@riverpod` codegen approach.
- **Models are Freezed-immutable** — the `User` data class in `future_provider/` uses `@freezed` for value equality, `copyWith`, and automatic `fromJson`/`toJson`.
- **Theme state is global** — `change_theme_provider.dart` is a `StateProvider<bool>` consumed at the `MaterialApp` root, wrapping every demo page.

---

## Key Features

### Provider Patterns (8 variations)
- **Basic codegen providers** — `@Riverpod(keepAlive: true)` and `@riverpod` with `family` parameter
- **Hand-written providers** — `StateProvider`, `Provider`, `family`, `autoDispose`, `autoDispose.family`
- **NotifierProvider** — modern `Notifier<int>` class with `increment`/`decrement`
- **StateNotifierProvider** — legacy `StateNotifier<int>` pattern for comparison
- **FutureProvider** — async data fetching via Dio + Freezed models with `@riverpod` codegen
- **StreamProvider** — `Stream.periodic` with `autoDispose`
- **Change Theme** — `StateProvider<bool>` toggling `ThemeData.light()` / `ThemeData.dark()`

### Developer Experience
- **device_preview** integration — inspect your app across device frames and locales during development
- **riverpod_lint** — real-time lint feedback for provider misuse
- **Provider lifecycle logging** — `ref.onDispose(() => print(...))` traces provider creation and disposal in the console
- **Pull-to-refresh** — `userListProvider` uses `ref.invalidate()` for clean data refresh

---

## Getting Started & Local Setup

### Prerequisites

- **Flutter SDK** `>=3.29` ([install guide](https://docs.flutter.dev/get-started/install))
- **Dart** `^3.8.1` (bundled with Flutter)
- A platform target configured: Android SDK, Xcode (iOS/macOS), Chrome (web), or Windows SDK

### Setup Steps

```bash
# 1. Clone the repository
git clone https://github.com/your-username/riverpod_app.git
cd riverpod_app

# 2. Fetch dependencies
flutter pub get

# 3. Generate code (riverpod_generator + freezed + json_serializable)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app (opens in DevicePreview if supported)
flutter run
```

> **Note:** Run `dart run build_runner watch` during development to automatically regenerate code on file changes. Always regenerate after editing any file containing `@riverpod`, `@freezed`, or `part '*.g.dart'`.

---

## Screenshots & UI Showcase

<p align="center">
  <table>
    <tr>
      <td align="center" width="33%">
        <img src="https://via.placeholder.com/280x500/1a1a2e/e0e0e0?text=Home+Hub" alt="Home Hub" width="100%"><br />
        <em>Navigation Hub</em>
      </td>
      <td align="center" width="33%">
        <img src="https://via.placeholder.com/280x500/16213e/e0e0e0?text=FutureProvider" alt="FutureProvider" width="100%"><br />
        <em>FutureProvider + Dio</em>
      </td>
      <td align="center" width="33%">
        <img src="https://via.placeholder.com/280x500/0f3460/e0e0e0?text=Theme+Toggle" alt="Theme Toggle" width="100%"><br />
        <em>Light / Dark Theme</em>
      </td>
    </tr>
    <tr>
      <td align="center" width="33%">
        <img src="https://via.placeholder.com/280x500/533483/e0e0e0?text=Notifier" alt="Notifier" width="100%"><br />
        <em>NotifierProvider</em>
      </td>
      <td align="center" width="33%">
        <img src="https://via.placeholder.com/280x500/1a1a2e/e0e0e0?text=Family" alt="Family" width="100%"><br />
        <em>Family Provider</em>
      </td>
      <td align="center" width="33%">
        <img src="https://via.placeholder.com/280x500/16213e/e0e0e0?text=Stream" alt="Stream" width="100%"><br />
        <em>StreamProvider</em>
      </td>
    </tr>
  </table>
</p>

> **Note:** Replace placeholder images with actual screenshots captured from the running app. The project displays correctly in both light and dark mode via the built-in theme toggle.

---

## Directory Structure

```
lib/
├── main.dart                              # Entry point: DevicePreview > ProviderScope > MyApp
├── home_page.dart                         # Navigation hub (9 demo pages)
├── basic/                                 # @riverpod codegen providers (keepAlive, family)
├── change_theme/                          # StateProvider<bool> theme toggle
├── future_provider/                       # FutureProvider + Dio + Freezed
│   ├── models/user.dart                   # @freezed User data class
│   ├── provider/user_provider.dart        # @riverpod Dio instance
│   └── pages/user/                        # ConsumerWidget with pull-to-refresh
├── notifier_provider/state_NotifierProvider/  # NotifierProvider (modern Notifier<int>)
├── provider_setProvider/                  # Hand-written provider demos
│   ├── pages/basic/                       # StateProvider + Provider + @riverpod
│   ├── pages/auto_dispose/                # autoDispose variants
│   ├── pages/family/                      # family modifiers
│   └── widgets/custom_button.dart         # Shared navigation widget
├── state_NotifierProvider/                # Legacy StateNotifierProvider pattern
└── stream_provider/                       # StreamProvider.autoDispose<int>
```

---

## Contact & Licensing

**Project Maintainer** — Your Name

[![GitHub](https://img.shields.io/badge/GitHub-@yourusername-181717?logo=github)](https://github.com/yourusername)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-yourprofile-0A66C2?logo=linkedin)](https://linkedin.com/in/yourprofile)
[![Email](https://img.shields.io/badge/Email-hello@example.com-EA4335?logo=gmail)](mailto:hello@example.com)

Distributed under the **MIT License**. See `LICENSE` for more information.

---

<p align="center">
  Built with ❤️ using Flutter & Riverpod
</p>
