# AGENTS.md

Guidance for AI coding agents working in this repo.

## What this is

Engineers’ Playbook: notes and runnable examples for junior to mid-level engineers. Examples are small and teach one idea each.

## Layout

| Path | What it is |
|---|---|
| `playbook_polymorphism/` | Flutter app: strategy and factory versus conditionals, plus small pages for other patterns (decorator, template method, null object, registry, adapter), then production cases that combine them (payment flow, product actions, code screen). Mock data only: mock data source, repository, BLoC per feature. |
| `helpers/playbook_toolkit/` | Shared Dart helpers (exceptions, repository executors, mock network, and more). |
| `helpers/playbook_uikit/` | Shared design system and widgets. |

The root `pubspec.yaml` is a Dart workspace over the three packages above. Commit its `pubspec.lock`, so a fresh clone gets the same versions.

## Commands

Always use `fvm`. The version is pinned in `.fvmrc`. Never run plain `flutter` or `dart`.

```bash
fvm flutter pub get                      # from the repo root
fvm flutter analyze                      # from a package folder
fvm flutter test                         # from a package folder
fvm dart run build_runner build   # in playbook_polymorphism (and playbook_toolkit), after changing routes or freezed models
```

Analyzer must be clean in every package, and the app's tests green, before you call a change done. The helper packages have no tests.

## Rules

- **Mock only.** No real API clients, no secrets, no Firebase.
- **Keep examples small.** One idea per example. Don't add abstractions the example isn't about.
- **Side-by-side examples must look identical.** The parity tests enforce it. If you change one screen, change its twin.
- **Errors have one path.** The data layer throws `AppException`. The UI shows it with `FailureWidget` (a screen or a card, with retry) or `NotificationSnackBar.showExceptionMessage` (after an action). The words live in `AppExceptionUi` and nowhere else. Never leave a loader spinning on failure.
- **Mark template methods `@nonVirtual`** (`package:meta`). Dart still compiles an override, but the analyzer warns, and the analyzer must stay clean.
- **Keep the layers apart.** Pure Dart in `domain/` and `data/`, Flutter only in `ui/`. `ui/` never imports `data/`: the DI module in `configs/` is the one place that names data classes.
- **Features are flat folders in `lib/features/`.** Don't group big features under a folder (no `production/`). Group only small, tightly related ones, like `application/`.
- **Production examples are named `prod_*`** (`prod_payment`, `prod_code_entry`, `prod_product_actions`). They are still flat features. Cards shared by pattern pages (`ArticleRuleOfThumbCard`, `CasePatternsCard`) live in `playbook_uikit`.
- **`ui/` layout.** With one subfeature, `bloc/`, `screen/` and `widget/` sit directly in `ui/`. With several (`strategy`, `factory`), each gets its own folder inside `ui/`.
- **Unused helpers stay.** `playbook_toolkit` and `playbook_uikit` may hold helpers no example uses yet. They are there for later changes. Don't delete them, and keep them clean like any other code.
- **Money is an `int` in cents**, never a `double`. Format it only at the edge.
- **Event handlers that start work use `droppable()`** (`bloc_concurrency`), so a second tap can't start a second order.
- **Tappable means accessible.** Use `AppTapArea`, `InkWell` or a Material button, not a bare `GestureDetector`, and pass `onPressed: null` for a disabled button.
- **Don't hand-edit generated files** (`*.gr.dart`, `*.freezed.dart`, `*.g.dart`).
- **Docs live in two places:** the root `README.md` and `playbook_polymorphism/README.md`. Don't add a README, CHANGELOG or LICENSE-style file to a helper package or a generated folder, and delete the ones Flutter creates (for example under `ios/`). Update the READMEs when a path, a package name or a feature changes.

## Writing docs

Any `.md` file is short, casual and advice-style, as if you were talking to one person you mentor. Put the point first, use plain words, and end with something the reader can do. Cut a third before you call it done.
