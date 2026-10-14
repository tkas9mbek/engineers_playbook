# Architecture

## There is no silver bullet

Anyone who tells you "this is THE architecture" is selling something. The right one depends on:

- **Project size.** A weekend prototype and a banking app are different animals.
- **Team.** Two seniors can share a lot in their heads. Fifteen people with mixed levels can't.
- **Requirements.** How long it lives, how often it changes, how bad a bug is.

Pick for the project you have, not the one you imagine.

## Clean Architecture is principles, not a template

The *Clean Architecture* book shows one example architecture: the famous circles. Many people copy the circles and miss the point. The book is really a list of **principles**. Here they are in plain words, with what each one means for a Flutter app.

### The tools (paradigms)

- **Structured programming:** small pieces you can reason about. *Small functions, no clever jumps.*
- **Object-oriented:** polymorphism lets you flip a dependency. *This is how `domain` can define a contract and `data` can implement it.*
- **Functional:** fewer moving parts, because less state changes. *Immutable models and immutable states.*

### SOLID (how to shape classes)

- **S, Single Responsibility:** one reason to change. *A widget draws, a BLoC coordinates, a repository fetches.*
- **O, Open/Closed:** add behavior by adding code, not editing old code. *See [`playbook_polymorphism`](../playbook_polymorphism).*
- **L, Liskov Substitution:** a subtype must work anywhere its parent works. *A mock data source must behave like the real one, or your tests lie.*
- **I, Interface Segregation:** small interfaces. Don't make people depend on what they don't use.
- **D, Dependency Inversion:** depend on abstractions, and let details depend on your rules. *The repository knows a `DataSource` contract, never Dio.*

### Components (how to group classes into packages and features)

Cohesion, what goes together:

- **REP (Reuse/Release Equivalence):** if you publish it as a unit, version it as a unit.
- **CCP (Common Closure):** things that change together live together. *One feature, one folder.*
- **CRP (Common Reuse):** don't force users to take things they don't need. *Don't put a date helper in the same package as the payment screens.*

Coupling, how they connect:

- **ADP (Acyclic Dependencies):** no cycles between packages. *If A imports B and B imports A, merge or split them.*
- **SDP (Stable Dependencies):** depend toward things that rarely change. *Features depend on `uikit`, never the reverse.*
- **SAP (Stable Abstractions):** the more things depend on you, the more abstract you should be.

### Architecture (the big ideas)

- **Keep options open.** A good architecture lets you delay and change decisions (database, state management, backend).
- **The Dependency Rule.** Source code dependencies point toward the business rules. Inner code never knows outer code.
- **Boundaries.** Draw a line where two parts change for different reasons, and cross it through an interface.
- **Policy and level.** The farther from input and output, the higher the level. High-level rules shouldn't know about low-level details.
- **Business rules.** Entities hold rules true for the whole business. Use cases hold rules for this app.
- **Screaming architecture.** Your folders should say what the app *does* ("payments", "orders"), not which framework it uses.
- **Humble object.** Keep the hard-to-test part dumb (the widget) and push logic out of it. *Thin widgets, logic in BLoCs and UI models.*
- **Partial boundaries.** Full boundaries are expensive. Sometimes a half boundary is enough. Skip the ceremony until you need it.
- **Main is a plugin.** Startup and wiring are the dirty part. Keep them in one place. *`main.dart` and the DI modules.*
- **Tests are part of the architecture.** Tests depend on your code, never the other way round.
- **Services aren't automatically architecture.** Splitting into services doesn't give you clean dependencies by itself.

### Details

The database, the web, and the framework are **details**. They sit at the edge. Yes, Flutter is a detail too. *That's why `domain` and `data` have no Flutter imports.*

### So what do you do with this?

Learn the principles. Then build something that fits your project. You'll use some every day (SOLID, the Dependency Rule) and some rarely (REP, SAP). The circles are not mandatory.

## Philosophy: less pain, today and later

Two ways to hurt your team:

1. **Over-engineering.** You build layers for a future that never comes. Today's devs pay with too many classes to write, and reviewers pay with too many to check.
2. **Tech debt.** You take shortcuts. Devs in two years pay, and nobody remembers why it's like this.

The goal is the middle: **solve today's problem simply, in a way that doesn't trap the next person.**

Before adding anything, ask:

- Does this remove pain **now**, or only maybe someday?
- Will a new dev understand it in five minutes?
- If we get it wrong, how hard is it to change later?

If it's cheap to change later, keep it simple now. If it's expensive to change later (data formats, module boundaries, public APIs), think harder now.

### Abstraction

Abstraction has a price. Every interface is one more file to write, read, and review.

Add an abstraction when:

- **You need to fake it in tests.** (A data source: real API vs mock.)
- **It really varies.** (Two implementations exist, or will exist soon.)
- **It lets you extend without editing old code.** (A new case is a new class.)

Don't add one "just in case".

I learned this the hard way. On one app I made the repository abstract and the data provider concrete. It was backwards. The repository had one implementation and never needed a fake, while the data provider was the thing I needed to swap in tests. Flipping it (concrete repository, abstract data source) removed files and made testing easier.

Quick test: *"If I delete this interface, what gets worse today?"* If the answer is "nothing", delete it.

### Dependencies

One job: **make a change in one file touch as few other files as possible.**

You get there with rules about who may depend on whom:

- Dependencies point one way: UI → domain ← data. Domain depends on nothing.
- Domain and data are pure Dart. Only `ui/` knows Flutter.
- A BLoC never depends on another BLoC. A repository never depends on another repository. If two things need to talk, coordinate them one level up.
- No cycles. Ever.
- Models carry raw data. Labels, icons and colors are built in the UI layer, so a design change never touches your domain.

These rules are cheap to state and easy to check. That's what a good rule looks like.

### Coding rules

Rules save time. Every decision a dev doesn't have to make is minutes saved, and one less argument in review.

- Make rules for things people would otherwise debate: folder layout, naming, where logic goes, how errors travel.
- Don't make rules for everything. Nobody remembers 100 rules, so they follow none.
- **Automate what you can.** A lint beats a code review comment every time. Reviewers should discuss design, not commas.
- A rule people keep breaking is either wrong or not enforced. Fix the rule, or add a lint.
- Every rule needs a one-line "why". If you can't write it, drop the rule.
- Keep classes small. If you can't explain it in a sentence, split it.

### Errors

Decide once how errors travel, so nobody invents their own.

- The data layer turns every failure into **one sealed exception type**. Nothing else escapes.
- The UI layer has **one place** that turns an exception into text and a retry button.
- Screens never look inside an exception. They ask "can I retry?" and show the message.

Add a new exception type only when the UI needs to react differently. Not for every backend error code.

### Behavior around repositories

Retry, error handling and logging are the same in every repository. Don't copy them into each one.

Wrap them instead: a small executor does the call, and you stack behaviors on it (`withErrorHandling().withRetry()`). The repository holds one executor and doesn't know what's stacked on it. A new behavior is a new wrapper, not a change to twenty repositories.

### Testing

Design for the test you want to write.

- The test that earns the most: **real BLoC + real repository + a fake data source.** It covers the happy path and one error, and it only works because the data source is abstract.
- Don't unit-test code that only forwards a call.
- Add one cheap test that builds the whole DI graph. It catches forgotten registrations.
- A fake must behave like the real thing (Liskov again), or your green tests mean nothing.

### What you gave up

Every architecture is a trade. Write down the costs you accepted, so the next dev doesn't "discover" them as bugs.

Mine, for example: features depend on each other sometimes, because real features have to talk. And each package keeps its own localization, so packages stay self-contained. I picked these on purpose, and I'd rather say it out loud.

## Example: flutter_starter

This is my go-to: [flutter_starter](https://github.com/tkas9mbek/flutter_starter). I built it from the best solutions I found across tens of real projects. It's not perfect and not the only way, but if you're starting out, read it as a reference.

Every feature has the same shape:

```
lib/features/{feature}/
├── data/      # implements the data source contracts (Api*, Local*, Mock*)
├── domain/    # abstract DataSource + concrete Repository. Pure Dart.
├── model/     # data classes. Pure Dart.
├── configs/   # the feature's DI module
└── ui/        # BLoC, screens, widgets. The only place Flutter lives.
```

How it applies what's above:

| Idea | In the starter |
|---|---|
| Dependency Rule | UI → domain ← data. No Flutter in `data/` or `domain/`. |
| Abstract enough | The data source is abstract (real API vs mock). The repository is a plain class. |
| No horizontal deps | A BLoC never uses another BLoC. A repository never uses another repository. |
| Behavior around repositories | A `RepositoryExecutor` with `withErrorHandling()` and `withRetry()`. |
| Errors | A sealed `AppException`, mapped to UI text in one place. |
| Testing | Mock twins of the data sources, so real BLoC + repository run offline. |
| Rules that stick | Custom lints enforce the layer rules, so reviews don't have to. |

Want to see "abstract enough" in a small runnable app? Look at [`playbook_polymorphism`](../playbook_polymorphism).
