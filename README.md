# Engineers’ Playbook

Lessons from 8 years of professional engineering (11 years of coding), written down so you don't have to learn them the slow way.

Inspired by Ray Dalio's *Principles*: **Pain + Reflection = Progress.** Every example comes from a real decision or mistake, and shows the reasoning, not only the conclusion.

## What's inside

- [`playbook_polymorphism/`](playbook_polymorphism): a runnable Flutter app. Strategy and factory next to the `if`/`switch` version, small pages for other patterns, and cases that combine them.
- [`helpers/`](helpers): two small packages the examples share. You don't need to read them first.

## Run it

```bash
brew tap leoafarias/fvm && brew install fvm   # or: dart pub global activate fvm
fvm install
fvm flutter pub get
cd playbook_polymorphism
fvm flutter run
```

Everything runs on mock data. No keys, no backend.

Next, open the app's [README](playbook_polymorphism/README.md) and follow "Start here".

## License

[MIT](LICENSE).
