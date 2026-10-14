# playbook_polymorphism

Two ways to write the same screen, side by side. Each pair of screens **looks identical**; only the code differs. A test in `test/features/**/*_parity_test.dart` checks that the visible text and the results of every action match, so the comparison stays honest.

Everything runs on mock data. There are no API clients.

The first two sections end with a short **article** screen that sums up the trade-off in plain words. They live in each feature's `ui/common/screen/`. The third section has no comparison: one small page per pattern.

## Run it

From the repository root:

```bash
fvm flutter pub get
cd playbook_polymorphism
fvm flutter run
```

```bash
fvm flutter test
```

## 1. Strategy over conditionals

**Problem:** a transfers screen behaves differently for an adult and a child: title, ways to send, daily limit, fee, error and confirmation messages.

| | Strategy | Conditional |
|---|---|---|
| Screen | [`TransferStrategyView`](lib/features/transfer/ui/strategy/widget/transfer_strategy_view.dart) | [`TransferConditionalView`](lib/features/transfer/ui/conditional/widget/transfer_conditional_view.dart) |
| Variation lives in | [`TransferStrategy`](lib/features/transfer/ui/strategy/model/transfer_strategy.dart) and two subclasses | seven `switch (audience)` blocks inside the view |
| Screen knows about audiences | no, it holds one `TransferStrategy` | yes, it holds an `Audience` enum |
| New audience (e.g. business) | add one class, pass it in | edit every switch in every screen that uses `Audience` |
| Testing the rules | plain unit test, no widgets ([`transfer_strategy_test.dart`](test/features/transfer/transfer_strategy_test.dart)) | needs a widget test |

The choice of strategy is made in exactly one place: [`TransferStrategyScreen._resolveStrategy`](lib/features/transfer/ui/strategy/screen/transfer_strategy_screen.dart). In a real app that would be the route or the DI module.

The idea came from a production payments app, where one shared "transfers" screen takes a standard or a child strategy chosen by the route.

**Use a strategy when** the behavior differs by *who* is calling or *which environment* it runs in, and the screen should not care. **Skip it when** there are one or two tiny differences. A ternary is fine.

## 2. Factory method over conditionals

**Problem:** the backend sends products (`debit`, `deposit`, `credit`) as strings. The UI shows a title, icon, color, subtitle, badge and an action for each.

| | Factory method | Conditional |
|---|---|---|
| Screen | [`ProductFactoryScreen`](lib/features/product/ui/factory/screen/product_factory_screen.dart) | [`ProductConditionalScreen`](lib/features/product/ui/conditional/screen/product_conditional_screen.dart) |
| Variation lives in | [`ProductUiModel`](lib/features/product/ui/factory/model/product_ui_model.dart): one sealed class, one small subclass per type | five `switch (product.type)` getters in the tile (each with an `unknown` case) |
| Where the type is switched on | once, inside `ProductUiModel.from` | in every getter |
| New product type | add a subclass and one line in `from` | edit every getter |

Layers, which the Medium article version did not separate:

- `Product` and `ProductType` are domain data: pure Dart, no labels, icons or colors.
- `ProductUiModel` is a presentation type in `ui/`. A BLoC would never hold it.
- The UI model does not call `Navigator`. It returns a message, and the widget decides what to do with it.

**Dart 3 note:** a `sealed` class with an exhaustive `switch` makes the compiler flag every place you forgot a new case. That already helps the conditional version. The factory method still wins when the same enum is switched on in *several* places: you write the switch once.

## 3. Design patterns

Patterns I use every day, one short page each: a few words, a small live demo, and when to use it. There is no conditional twin to compare with.

| Pattern | Demo | Where to look |
|---|---|---|
| Decorator | Load an exchange rate from a backend that fails twice. Retry hides it, Logging shows it. | [`RateModule`](lib/features/rate/configs/rate_module.dart) stacks the executors; [`RateLoggingExecutor`](lib/features/rate/data/rate_logging_executor.dart) is the one written for the demo |
| Template method | Two receipts built by the same `buildRows`. | [`ReceiptUiModel`](lib/features/receipt/ui/model/receipt_ui_model.dart) and its two subclasses |
| Null object | A cart with and without a promo code. The summary has no null checks. | [`NoCartDiscount`](lib/features/cart/domain/no_cart_discount.dart) and [`CartSummaryCard`](lib/features/cart/ui/widget/cart_summary_card.dart) |
| Registry | Read remote configs by type: `get<RemoteSupportConfig>()`. A key the backend lacks falls back to a default. | [`RemoteConfigRegistry`](lib/features/remote_config/domain/remote_config_registry.dart) |

## Layout

Each feature follows the [flutter_starter](https://github.com/tkas9mbek/flutter_starter) shape: `data/`, `domain/`, `model/`, `configs/`, `ui/`. In the two comparison features, `ui/common/` holds what both screens share (including the article) and there is one folder per screen. The pattern features are small, so their `ui/` is flat: `bloc/`, `model/`, `screen/`, `widget/`.

```
lib/
  core/                 DI (GetIt modules), router (auto_route), globals
  features/
    application/        MaterialApp, theme, and the home screen
    transfer/           mock data source, repository, 2 BLoCs (balance, send)
      ui/common/        shared widgets, BLoCs, the article
      ui/strategy/      TransferStrategy + 2 strategies, strategy view
      ui/conditional/   conditional view
    product/            mock data source, repository, 1 BLoC (product list)
      ui/common/        list loader, tile, the article
      ui/factory/       ProductUiModel, factory screen
      ui/conditional/   conditional screen
    rate/               decorator: executors, mock data source, 1 BLoC
    receipt/            template method: UI models only, no data layer
    cart/               null object: discount, no-discount, summary card
    remote_config/      registry: descriptors, mock data source, 1 BLoC
test/                   unit tests, BLoC tests, parity tests, pattern tests
```

Both features run on a mock "backend": the product list waits one second, then returns JSON that is parsed into a Freezed `Product`. The enum uses `@JsonValue`, with an `unknown` fallback.

Shared helper packages are in [`../helpers`](../helpers): `playbook_toolkit` (exceptions, repository executors, mock network) and `playbook_uikit` (theme and widgets).

## Exercises

1. Add a `BusinessTransferStrategy` with a 5000 limit and 0.5% fee. How many files do you touch? Do the same in the conditional version.
2. Add a `loan` product type. Let the compiler tell you what to change in each version.
3. Make `ProductUiModel.onTap` navigate to a details screen instead. Where should that code live?
4. Add a `CachingExecutor` decorator and stack it between Retry and Logging. What changes in the repository?
5. Add a `RemoteBannerConfig` to the registry. How many files do you touch?
