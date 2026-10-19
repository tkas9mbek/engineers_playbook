import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/factory/ui/common/widget/product_tile.dart';
import 'package:playbook_polymorphism/features/factory/ui/factory/model/product_ui_model.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/domain/product_action_strategy.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/bloc/product_action_bloc.dart';
import 'package:playbook_polymorphism/features/prod_product_actions/ui/bloc/product_action_state_event.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/widgets/button/app_outlined_button.dart';
import 'package:playbook_uikit/widgets/status/notification_snack_bar.dart';

/// One product and its action. There is no `if` on the product type. The look
/// comes from [model] (a UI model, in `ui/`), and the action from [strategy]
/// (a domain strategy). Each was built by its own factory.
class ProductActionTile extends StatelessWidget {
  const ProductActionTile({
    required this.model,
    required this.strategy,
    super.key,
  });

  final ProductUiModel model;
  final ProductActionStrategy strategy;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final label = strategy.label;

    return BlocProvider(
      create: (context) => ProductActionBloc(strategy),
      child: BlocConsumer<ProductActionBloc, ProductActionState>(
        listener: (context, state) {
          if (state case SuccessProductActionState(:final message)) {
            NotificationSnackBar.show(
              context,
              NotificationSnackBar.success(text: message),
            );
          } else if (state case FailureProductActionState(:final exception)) {
            NotificationSnackBar.showExceptionMessage(
              context,
              exception: exception,
            );
          }
        },
        builder: (context, state) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [
            ProductTile(
              title: model.title,
              subtitle: model.subtitle,
              icon: model.icon,
              accent: model.accent(theme),
              badge: model.badge,
            ),
            if (label != null)
              AppOutlinedButton.medium(
                context: context,
                text: label,
                loading: state.isPerforming,
                onPressed: () => context.read<ProductActionBloc>().add(
                  const ProductActionEvent.performed(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
