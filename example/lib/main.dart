import 'package:wv_user_agent/wv_user_agent.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userAgent = 'Loading...';
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _loadUserAgent();
  }

  Future<void> _loadUserAgent() async {
    final ua = await WvUserAgent.userAgent;
    setState(() {
      _userAgent = ua;
    });

    // Set user agent in WebView
    _controller =
        WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setUserAgent(_userAgent)
          ..loadRequest(Uri.parse('https://www.whatismybrowser.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('User Agent Test')),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('User Agent: $_userAgent', textAlign: TextAlign.center),
            ),
            Expanded(child: WebViewWidget(controller: _controller)),
          ],
        ),
      ),
    );
  }
}
