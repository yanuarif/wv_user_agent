import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wv_user_agent/wv_user_agent.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getUserAgent test', (WidgetTester tester) async {
    final String userAgent = await WvUserAgent.userAgent;
    // The user agent string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(userAgent.isNotEmpty, true);
  });
}
