import 'package:flutter_test/flutter_test.dart';
import 'package:wv_user_agent/wv_user_agent.dart';

void main() {
  test('User Agent should not be empty', () async {
    final userAgent = await WvUserAgent.userAgent;

    // Check that the User-Agent is not empty and contains “Mozilla”
    expect(userAgent.isNotEmpty, true);
    expect(userAgent.contains('Mozilla'), true);
  });

  test('User Agent should be different from default Dart User-Agent', () async {
    final userAgent = await WvUserAgent.userAgent;

    // Check that User-Agent is not default for dart:io
    expect(userAgent, isNot(equals('Dart/3.2 (dart:io)')));
  });

  test('Handle errors gracefully', () async {
    try {
      final userAgent = await WvUserAgent.userAgent;
      expect(userAgent, isNotEmpty);
    } catch (e) {
      fail('The plugin should not throw an exception: $e');
    }
  });
}
