import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/transfer/ui/common/screen/transfer_strategy_article_screen.dart';

import '../../support/pump_app.dart';

void main() {
  testWidgets('shows both sides and the rule of thumb', (tester) async {
    await tester.pumpApp(const TransferStrategyArticleScreen());

    expect(find.text('Strategy vs conditional'), findsOneWidget);
    expect(find.text('Conditional'), findsOneWidget);
    expect(find.text('Strategy'), findsOneWidget);
    expect(find.text('Rule of thumb'), findsOneWidget);
  });
}
