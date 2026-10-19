import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/features/decorator/ui/bloc/rate_details_bloc.dart';
import 'package:playbook_uikit/theme/theme_provider.dart';
import 'package:playbook_uikit/utils/extensions/app_exception_ui_extension.dart';
import 'package:playbook_uikit/widgets/button/app_elevated_button.dart';
import 'package:playbook_uikit/widgets/misc/app_card.dart';
import 'package:playbook_uikit/widgets/misc/app_list_tile.dart';
import 'package:playbook_uikit/widgets/misc/grouped_rows_card.dart';

/// A button that loads the rate, and below it what the decorators did:
/// the rate (or the error) and every call the logging decorator saw.
class RateDecoratorPanel extends StatelessWidget {
  const RateDecoratorPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).theme;
    final textStyles = ThemeProvider.of(context).textStyles;

    return BlocBuilder<RateDetailsBloc, RateDetailsState>(
      builder: (context, state) => Column(
        spacing: 16,
        children: [
          AppCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Outside in', style: textStyles.mediumBody16),
                const SizedBox(height: 4),
                for (final layer in const [
                  '1. Retry: tries again when a call fails',
                  '2. Error handling: turns any error into AppException',
                  '3. Logging: writes every call to the log',
                  '4. Backend: fails twice, then answers',
                ])
                  Text(
                    layer,
                    style: textStyles.regularBody14.copyWith(
                      color: theme.textSecondary,
                    ),
                  ),
                const SizedBox(height: 12),
                AppElevatedButton.big(
                  context: context,
                  text: 'Get the USD rate',
                  loading: state.isLoading,
                  onPressed: () => context.read<RateDetailsBloc>().add(
                    const RateDetailsEvent.requested(),
                  ),
                ),
              ],
            ),
          ),
          switch (state) {
            SuccessRateDetailsState(:final rate, :final calls) =>
              GroupedRowsCard(
                children: [
                  AppListTile(
                    title: 'USD rate',
                    value: '$rate KGS',
                    icon: Icons.currency_exchange,
                  ),
                  for (final call in calls) AppListTile(title: call),
                ],
              ),
            // Not a FailureWidget on purpose: the call log must stay visible.
            FailureRateDetailsState(:final exception, :final calls) =>
              GroupedRowsCard(
                children: [
                  AppListTile(
                    title: 'Failed for good',
                    value: exception.message,
                    danger: true,
                  ),
                  for (final call in calls) AppListTile(title: call),
                ],
              ),
            _ => const SizedBox.shrink(),
          },
        ],
      ),
    );
  }
}
