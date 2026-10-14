# Engineers’ Playbook

Lessons from 8 years of professional engineering (11 years of coding), written down so you don't have to learn them the slow way.

Inspired by Ray Dalio's *Principles*: **Pain + Reflection = Progress.** Every example comes from a real decision or mistake, and shows the reasoning, not only the conclusion.

For engineers with 0-4 years of experience who want to grow into confident, independent seniors.

## What's inside

| Path | What it is |
|---|---|
| [flutter_engineering/](flutter_engineering/) | Short notes on how I build Flutter apps: FVM, architecture |
| [playbook_polymorphism/](playbook_polymorphism/) | Strategy and factory method versus conditionals as side-by-side Flutter screens, plus decorator, template method, null object and registry |
| [helpers/playbook_toolkit/](helpers/playbook_toolkit/) | Shared Dart helpers: exceptions, repository executors, mock network, form utils |
| [helpers/playbook_uikit/](helpers/playbook_uikit/) | Shared design system: theme and widgets |

Every package here is named `playbook_*`. The examples are written to be read, so the helper packages have no README of their own: the code and the notes above are the guide.

## Getting started

The repository is a Dart workspace (see [`pubspec.yaml`](pubspec.yaml)) pinned to the Flutter version in [`.fvmrc`](.fvmrc).

```bash
fvm install
fvm flutter pub get
cd playbook_polymorphism
fvm flutter run
```

Run the tests (the helper packages have none; the example app does):

```bash
(cd playbook_polymorphism && fvm flutter test)
```

## How each example is written

1. **Context**: the situation, so you can judge whether it applies to you.
2. **Side by side**: the same behavior written two ways, with a test proving the screens match. Pattern pages (decorator, template method, null object, registry) have one small demo instead.
3. **When to use it**, including when the "better" pattern is overkill.

## Start here

1. Read [FVM](flutter_engineering/01-fvm.md), then [Architecture](flutter_engineering/02-architecture.md).
2. Run the app and open the three sections on the home screen: *Strategy over conditionals*, *Factory method over conditionals* and *Design patterns*.
3. Read the code behind the tile you just tapped. [`playbook_polymorphism/README.md`](playbook_polymorphism/README.md) says where to look.
