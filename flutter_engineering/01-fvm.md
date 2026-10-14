# Use FVM from day one

FVM (Flutter Version Management) pins the Flutter version **per project**. Do this before you write a single line of code.

## Why bother

Your teammates don't have the same Flutter on their Mac. Maybe you updated last week, they didn't. Maybe you have three projects, and each one needs a different version.

Without pinning, you get:

- "It works on my machine."
- `pub get` resolves different packages, because the Dart SDK is different.
- `build_runner` produces different generated code, so diffs are full of noise.
- A Flutter upgrade breaks every project at once, on a day you didn't choose.

With FVM, the version lives in the repo. Clone, install, run. Same result for everyone.

## Set it up

Install FVM once:

```bash
dart pub global activate fvm
```

Then in your project root:

```bash
fvm use 3.44.5
```

This writes `.fvmrc`, links the SDK in `.fvm/`, and runs `pub get`.

- **Commit** `.fvmrc`. That's the version everyone uses.
- **Ignore** `.fvm/`. It's just a local link.

A new teammate does this:

```bash
git clone <repo>
fvm install      # downloads the version from .fvmrc
fvm flutter run
```

## The one habit

Put `fvm` in front of every Flutter and Dart command:

```bash
fvm flutter pub get
fvm flutter test
fvm dart run build_runner build
```

If you type plain `flutter`, you use whatever is installed globally. That's exactly the problem we're avoiding. Easy to forget, so be strict about it. Same rule for scripts and docs: write `fvm flutter`, never `flutter`.

## Tell your IDE

The IDE doesn't know about FVM until you point it at the project's SDK.

- **VS Code:** in `.vscode/settings.json` set `"dart.flutterSdkPath": ".fvm/flutter_sdk"`.
- **Android Studio / IntelliJ:** Settings → Languages & Frameworks → Flutter → set the SDK path to `<project>/.fvm/flutter_sdk`.

## Monorepos

Put `.fvmrc` in the root, once. FVM looks upward, so `fvm flutter` works from any subfolder. This repo does exactly that.

## Upgrading Flutter

- Do it in its own PR. Don't mix it with features.
- Run `fvm use <new version>`, fix what breaks, commit `.fvmrc`.
- Everyone then runs `fvm install` once.

## CI

CI should use the same version as your laptop. Read it from `.fvmrc` instead of typing the number a second time, so there is only one place to change.