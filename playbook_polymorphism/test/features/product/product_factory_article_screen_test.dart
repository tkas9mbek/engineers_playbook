import 'package:flutter_test/flutter_test.dart';
import 'package:playbook_polymorphism/features/product/ui/common/screen/product_factory_article_screen.dart';

import '../../support/pump_app.dart';

void main() {
  testWidgets('shows both sides and the rule of thumb', (tester) async {
    await tester.pumpApp(const ProductFactoryArticleScreen());

    expect(find.text('Factory method vs conditional'), findsOneWidget);
    expect(find.text('Conditional'), findsOneWidget);
    expect(find.text('Factory method'), findsOneWidget);
    expect(find.text('Rule of thumb'), findsOneWidget);
  });
}
