import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/utils/cents_format.dart';
import 'package:playbook_polymorphism/features/strategy/domain/delivery_conditional_rules.dart';
import 'package:playbook_polymorphism/features/strategy/model/delivery_method.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/bloc/delivery_order_state_event.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_basket_chips.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_section.dart';
import 'package:playbook_polymorphism/features/strategy/ui/common/widget/delivery_summary_card.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/bloc/delivery_conditional_order_bloc.dart';
import 'package:playbook_polymorphism/features/strategy/ui/conditional/bloc/delivery_conditional_order_event.dart';
import 'package:playbook_uikit/utils/functions/safe_size_functions.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';
import 'package:playbook_uikit/widgets/text/title_subtitle.dart';

/// The checkout content, written with conditionals.
///
/// It looks exactly like the strategy version. The delivery rules come from
/// `DeliveryConditionalRules`: one `switch` per question, in one file.
class DeliveryConditionalView extends StatefulWidget {
  const DeliveryConditionalView({required this.method, super.key});

  final DeliveryMethod method;

  @override
  State<DeliveryConditionalView> createState() =>
      _DeliveryConditionalViewState();
}

class _DeliveryConditionalViewState extends State<DeliveryConditionalView> {
  int _subtotalCents = 4000;

  void _onPlaceOrder() {
    context.read<DeliveryConditionalOrderBloc>().add(
      DeliveryConditionalOrderEvent.submitted(
        subtotalCents: _subtotalCents,
        method: widget.method,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final method = widget.method;
    final unavailableReason = method.unavailableReasonFor(_subtotalCents);

    return BlocListener<DeliveryConditionalOrderBloc, DeliveryOrderState>(
      listener: (context, state) {
        if (state case SuccessDeliveryOrderState(:final subtotalCents)) {
          NotificationSnackBar.show(
            context,
            NotificationSnackBar.success(
              text:
                  'Order placed. Total \$${(subtotalCents + widget.method.feeFor(subtotalCents)).toDollars()}.',
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
                fee: method.feeFor(_subtotalCents),
                days: method.days,
                unavailableReason: unavailableReason,
              ),
            ),
            BlocBuilder<DeliveryConditionalOrderBloc, DeliveryOrderState>(
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
