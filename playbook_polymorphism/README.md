# playbook_polymorphism

Two ways to write the same screen, side by side. Each pair **looks identical**; only the code differs. A parity test (`test/features/**/*_parity_test.dart`) checks it, so the comparison stays honest. Everything runs on mock data.

## Start here

1. **Run the app** (below). Tap *Strategy*, then *Conditional*. Same screen.
2. **Read one file per screen:** [`DeliveryStrategyView`](lib/features/strategy/ui/strategy/widget/delivery_strategy_view.dart), then [`DeliveryConditionalView`](lib/features/strategy/ui/conditional/widget/delivery_conditional_view.dart). Then open [`DeliveryConditionalRules`](lib/features/strategy/domain/delivery_conditional_rules.dart): same rules, grouped by question instead of by option.
3. **Find the place that decides:** `DeliveryStrategy.from`, `ProductUiModel.from`. One switch per job is fine. The same switch repeated in every widget is the smell.
4. **Skip the BLoC files** (`bloc/`, `*_state_event.dart`) at first. They are plumbing.
5. **Do the exercises** at the bottom.

```bash
fvm flutter pub get      # from the repo root
cd playbook_polymorphism
fvm flutter run
fvm flutter test
```

## 1. Strategy over conditionals

**Problem:** the customer picks how an order arrives: standard, express or pickup. Each has a fee, an arrival time, a limit and an API call. Express only takes baskets up to $50.

Both versions are tidy. The conditional keeps its rules in one extension, one `switch` per question. The strategy keeps them in [`DeliveryStrategy`](lib/features/strategy/domain/delivery_strategy.dart) and three subclasses, one class per option.

| | Strategy | Conditional |
|---|---|---|
| Code is grouped by | option | question |
| Everything about Express | one file | one branch in each switch |
| New method (courier) | one class, one line in `from` | one branch in each switch |
| New question (a gift note) | edit every class | one new switch |

The strategy wins when options keep arriving or each one grows its own rules. **Skip it** for a few options with one-line rules.

## 2. Factory over conditionals

**Problem:** the backend sends products (`debit`, `deposit`, `credit`) as strings. The UI needs a title, icon, color, subtitle, badge and tap action for each.

| | Factory | Conditional |
|---|---|---|
| Rules live in | [`ProductUiModel`](lib/features/factory/ui/factory/model/product_ui_model.dart): a sealed class, one small subclass per type | one `switch (product.type)` that returns everything |
| New product type | one subclass, one line in `from` | one new branch |

`ProductUiModel.from` is the factory: one place turns a `Product` into the right class. For one screen, the single switch is fine. Reach for the classes when a second place needs the same type logic, or a type grows its own members and tests.

Money is whole cents in an `int`, never a `double`. Format it only at the edge (`CentsFormat`).

## 3. Other patterns

| Pattern | Look at |
|---|---|
| Decorator | [`RateModule`](lib/features/decorator/configs/rate_module.dart) stacks retry, error handling and logging |
| Template method | [`ReceiptUiModel`](lib/features/template_method/ui/model/receipt_ui_model.dart): `buildRows` is `@nonVirtual`, so the analyzer warns on an override |
| Null object | [`NoCartDiscount`](lib/features/null_object/domain/no_cart_discount.dart): no null checks in the summary |
| Registry | [`RemoteConfigRegistry`](lib/features/registry/domain/remote_config_registry.dart): finds the key and parser by type |
| Adapter | [`FahrenheitThermometerAdapter`](lib/features/adapter/data/fahrenheit_thermometer_adapter.dart): makes a sensor you can't edit fit our `Thermometer` |

## 4. Production examples

- **Payment:** a strategy per method, a template method that fixes the steps, and a factory that picks the strategy. An unknown QR code is a 404 from the mock bank (edit `_scannedCode` to try it).
- **Product actions:** the list from section 2 with a button per row. The look stays in `ProductUiModel` (`ui/`). The action (freeze, top up, repay) is a strategy in `domain/`, built by its own factory. The tile asks both and has no `switch`.
- **Code screen:** one strategy per channel. Each owns its input rule (digits, length) and how it masks the address.

**Take this with you:** the patterns don't compete. Ask what varies, then pick the smallest pattern that isolates it.

## Errors

Every feature fails the same way, so you can copy it:

1. The data layer throws one sealed `AppException`. Anything unexpected becomes `UnknownException`, and is logged.
2. The BLoC catches it and emits a failure state. It uses `droppable()`, so a second tap while one is running is ignored.
3. The UI shows `FailureWidget` (with retry) or a snackbar. The words live only in `AppExceptionUi`.

Try it: set `failureRate: 1` in [`ProductModule`](lib/features/factory/configs/product_module.dart), **hot restart** (the mock is created once) and open the products screen.

## Shortcuts

These keep the demos small. Don't copy them into a real app:

- A few plain English strings sit in `domain/` or `data/`. A real app keeps codes there and words them in `ui/`.
- Screens call the global `getIt`. It hides what a screen needs. Prefer passing dependencies in through the constructor.
- Mocks never change state: after "Repay" the balance is the same, so you can tap again.
- The conditional delivery rules sit in an extension. A real app would put those members in the enum.

## Exercises

Each one says when you're done.

1. **Courier delivery** (arrives today, costs $25). Add `placeCourierOrder` to the data source, repository and the test fakes in `test/support`. Then add it to both versions. *Done when* you can say: one class and one line, versus one branch in each switch.
2. **A gift note.** Add a question every delivery answers. Count the files you touch in each version. This is where the conditional wins.
3. **A `loan` product type.** Add `@JsonValue('loan')` to the enum, run `fvm dart run build_runner build`, and add a loan to the mock. Do it for the products screens and for Product actions. *Done when* the analyzer is clean and you counted the places you touched.
4. **A Kelvin adapter.** Write a second adapter for a sensor that reports Kelvin. *Done when* no screen changed.

Start with exercise 1. It takes ten minutes.
