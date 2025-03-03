import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:wv_user_agent_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Check if User-Agent is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Check that the text with User-Agent is displayed
    expect(find.textContaining('User Agent:'), findsOneWidget);
  });
}
