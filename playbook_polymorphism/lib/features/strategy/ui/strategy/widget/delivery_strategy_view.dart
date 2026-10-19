import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_strategy.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/bloc/delivery_order_state_event.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_basket_chips.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_section.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_summary_card.dart';
import 'package:playbook_polymorphism/features/strategy/ui/strategy/bloc/delivery_strategy_order_bloc.dart';
import 'package:playbook_uikit/utils/functions/safe_size_functions.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';
import 'package:playbook_uikit/widgets/text/title_subtitle.dart';

/// The checkout content, written with a strategy.
///
/// Read it top to bottom: there is no `if` and no `switch` on the delivery
/// method. Days and fee come from [strategy], and the bloc above places the
/// order through the same strategy.
class DeliveryStrategyView extends StatefulWidget {
  const DeliveryStrategyView({required this.strategy, super.key});

  final DeliveryStrategy strategy;

  @override
  State<DeliveryStrategyView> createState() => _DeliveryStrategyViewState();
}

class _DeliveryStrategyViewState extends State<DeliveryStrategyView> {
  int _subtotalCents = 4000;

  void _onPlaceOrder() {
    context.read<DeliveryStrategyOrderBloc>().add(
      DeliveryOrderEvent.submitted(_subtotalCents),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strategy = widget.strategy;
    final fee = strategy.feeFor(_subtotalCents);
    final unavailableReason = strategy.unavailableReasonFor(_subtotalCents);

    return BlocListener<DeliveryStrategyOrderBloc, DeliveryOrderState>(
      listener: (context, state) {
        if (state case SuccessDeliveryOrderState(:final subtotalCents)) {
          NotificationSnackBar.show(
            context,
            NotificationSnackBar.success(
              text:
                  'Order placed. Total \$${(subtotalCents + widget.strategy.feeFor(subtotalCents)).toDollars()}.',
            ),
          );
        } else if (state case FailureDeliveryOrderState(:final exception)) {
          NotificationSnackBar.showExceptionMessage(
            context,
            exception: exception,
          );
        }
      },
      child: SingleChildScrollView(
        padding: getScreenPadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            const TitleSubtitle(
              title: 'Checkout',
              subtitle: 'Pick a basket and see how it arrives',
              textAlign: TextAlign.start,
            ),
            DeliverySection(
              title: 'Basket',
              child: DeliveryBasketChips(
                selected: _subtotalCents,
                onSelected: (subtotalCents) =>
                    setState(() => _subtotalCents = subtotalCents),
              ),
            ),
            DeliverySection(
              title: 'Summary',
              child: DeliverySummaryCard(
                subtotalCents: _subtotalCents,
                fee: fee,
                days: strategy.days,
                unavailableReason: unavailableReason,
              ),
            ),
            BlocBuilder<DeliveryStrategyOrderBloc, DeliveryOrderState>(
              builder: (context, state) => AppElevatedButton.big(
                context: context,
                text: 'Place order',
                loading: state.isSubmitting,
                enabled: unavailableReason == null,
                onPressed: _onPlaceOrder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
