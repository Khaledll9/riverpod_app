# riverpod_app

Flutter app demonstrating Riverpod provider patterns.

## Commands

| Command | Purpose |
|---|---|
| `flutter pub get` | Install dependencies |
| `dart run build_runner build --delete-conflicting-outputs` | Run codegen (riverpod_generator, freezed, json_serializable) |
| `dart run build_runner watch` | Watch mode for codegen |
| `flutter test` | Run tests |
| `flutter run` | Run app (opens in DevicePreview on supported platforms) |

Always run codegen after editing any file containing `@riverpod`, `@freezed`, or `part '*.g.dart'` / `part '*.freezed.dart'`.

## Codegen

Generated files (`*.g.dart`, `*.freezed.dart`) are excluded from the analyzer in `analysis_options.yaml`. Do not edit them manually.

## Linting

Uses `custom_lint` plugin (enables `riverpod_lint` rules). Lint runs automatically in IDEs via `flutter_lints` + `custom_lint`. `avoid_print` is disabled (app uses `print` for provider lifecycle logging).

## Architecture

- `lib/main.dart` — entry point, wraps app in `DevicePreview` + `ProviderScope`
- `lib/home_page.dart` — navigation hub listing all demo pages
- Each subdirectory under `lib/` demonstrates a different Riverpod pattern:

| Directory | Pattern |
|---|---|
| `basic/` | `@riverpod` codegen providers (keepAlive, family) |
| `change_theme/` | `StateProvider<bool>` for theme toggle |
| `future_provider/` | `@riverpod` FutureProvider with Dio + Freezed models |
| `notifier_provider/state_NotifierProvider/` | `NotifierProvider` (modern pattern) |
| `provider_setProvider/` | Hand-written providers: StateProvider, Provider, family, autoDispose |
| `state_NotifierProvider/` | `StateNotifierProvider` (legacy `StateNotifier` pattern) |
| `stream_provider/` | `StreamProvider.autoDispose` |

## Tests

The existing `test/widget_test.dart` is stale — it tests a counter pattern no longer present in the app. It will fail if run against the current UI.
