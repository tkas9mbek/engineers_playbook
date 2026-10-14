# AGENTS.md

Guidance for AI coding agents working in this repo.

## What this is

Engineers’ Playbook: notes and runnable examples for junior to mid-level engineers. Examples are small and teach one idea each.

## Layout

| Path | What it is |
|---|---|
| `flutter_engineering/` | Markdown notes only. No code, no assets. |
| `playbook_polymorphism/` | Flutter app: strategy and factory method versus conditionals, plus small pages for other patterns (decorator, template method, null object, registry). Mock data only: mock data source, repository, BLoC per feature. |
| `helpers/playbook_toolkit/` | Shared Dart helpers (exceptions, repository executors, mock network). |
| `helpers/playbook_uikit/` | Shared design system and widgets. |

The root `pubspec.yaml` is a Dart workspace over the three packages above.

## Commands

Always use `fvm`. The version is pinned in `.fvmrc`. Never run plain `flutter` or `dart`.

```bash
fvm flutter pub get                      # from the repo root
fvm flutter analyze                      # from a package folder
fvm flutter test                         # from a package folder
fvm dart run build_runner build --delete-conflicting-outputs   # in playbook_polymorphism, after changing routes
```

Analyzer must be clean in every package, and the app's tests green, before you call a change done. The helper packages have no tests.

## Rules

- **Mock only.** No real API clients, no secrets, no Firebase.
- **Keep examples small.** One idea per example. Don't add abstractions the example isn't about.
- **Side-by-side examples must look identical.** The parity tests enforce it. If you change one screen, change its twin.
- **Follow the architecture notes** in `flutter_engineering/02-architecture.md`: pure Dart in `domain/` and `data/`, Flutter only in `ui/`.
- **Don't hand-edit generated files** (`*.gr.dart`, `*.freezed.dart`, `*.g.dart`).
- **Docs live in three places:** the root `README.md`, `flutter_engineering/` and `playbook_polymorphism/README.md`. Don't add a README, CHANGELOG or LICENSE-style file to a helper package or a generated folder, and delete the ones Flutter creates (for example under `ios/`). Update the READMEs when a path, a package name or a feature changes.

## Writing docs

Any `.md` file follows the style in `AGENTS.local.md` (local file, not committed). Short, casual, advice-style.
