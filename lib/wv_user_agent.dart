import 'package:flutter/services.dart';

class WvUserAgent {
  static const MethodChannel _channel = MethodChannel('wv_user_agent');

  /// Returns the device's user agent
  static Future<String> get userAgent async {
    final String ua = await _channel.invokeMethod('getUserAgent');
    return ua;
  }
}
