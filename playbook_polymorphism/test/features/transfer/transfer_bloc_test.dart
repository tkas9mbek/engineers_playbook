import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/transfer/data/mock_transfer_data_source.dart';
import 'package:playbook_polymorphism/features/transfer/domain/transfer_repository.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_balance_bloc.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/bloc/transfer_operation_bloc.dart';
import 'package:playbook_toolkit/data/mock/mock_network_behavior.dart';
import 'package:playbook_toolkit/data/repository_executor/raw_repository_executor.dart';
import 'package:playbook_toolkit/data/repository_executor/repository_executor_extensions.dart';

TransferRepository _buildRepository() => TransferRepository(
  const RawRepositoryExecutor().withErrorHandling(),
  const MockTransferDataSource(MockNetworkBehavior.instant()),
);

void main() {
  test('TransferBalanceBloc goes loading, then success', () async {
    final bloc = TransferBalanceBloc(_buildRepository())
      ..add(const TransferBalanceEvent.requested());

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const TransferBalanceState.loading(),
        const TransferBalanceState.success(2500),
      ]),
    );
  });

  test('TransferOperationBloc goes submitting, then success', () async {
    final bloc = TransferOperationBloc(_buildRepository())
      ..add(const TransferOperationEvent.submitted(100));

    await expectLater(
      bloc.stream,
      emitsInOrder([
        const TransferOperationState.submitting(),
        const TransferOperationState.success(100),
      ]),
    );
  });

  test(
    'TransferOperationBloc ends in failure when the backend fails',
    () async {
      final bloc = TransferOperationBloc(
        TransferRepository(
          const RawRepositoryExecutor().withErrorHandling(),
          const MockTransferDataSource(
            MockNetworkBehavior(wait: Duration.zero, failureRate: 1),
          ),
        ),
      )..add(const TransferOperationEvent.submitted(100));

      await expectLater(
        bloc.stream,
        emitsInOrder([
          const TransferOperationState.submitting(),
          isA<FailureTransferOperationState>(),
        ]),
      );
    },
  );
}
