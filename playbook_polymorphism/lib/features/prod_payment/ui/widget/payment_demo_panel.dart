import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playbook_polymorphism/core/global/global_variables.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_repository.dart';
import 'package:playbook_polymorphism/features/prod_payment/domain/payment_strategy.dart';
import 'package:playbook_polymorphism/features/prod_payment/model/payment_type.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/bloc/payment_bloc.dart';
import 'package:playbook_polymorphism/features/prod_payment/ui/widget/payment_view.dart';

/// A Standard / QR switcher above one payment view. The switcher is the only
/// place that names a payment type, and only to build the strategy.
class PaymentDemoPanel extends StatefulWidget {
  const PaymentDemoPanel({super.key});

  @override
  State<PaymentDemoPanel> createState() => _PaymentDemoPanelState();
}

class _PaymentDemoPanelState extends State<PaymentDemoPanel> {
  // Pretend the camera just scanned this code. Try 'nope' to see a failure.
  static const _scannedCode = 'coffee-bar-17';

  PaymentType _type = PaymentType.standard;

  void _onTypeChanged(Set<PaymentType> selection) {
    setState(() => _type = selection.first);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        SegmentedButton<PaymentType>(
          showSelectedIcon: false,
          segments: [
            for (final type in PaymentType.values)
              ButtonSegment(value: type, label: Text(type.label)),
          ],
          selected: {_type},
          onSelectionChanged: _onTypeChanged,
        ),
        // The key starts a fresh bloc, and an empty receipt, for each type.
        KeyedSubtree(
          key: ValueKey(_type),
          child: BlocProvider(
            create: (context) => PaymentBloc(
              PaymentStrategy.from(
                _type,
                getIt<PaymentRepository>(),
                scannedCode: _scannedCode,
              ),
            ),
            child: const PaymentView(),
          ),
        ),
      ],
    );
  }
}
