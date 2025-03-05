# WebView User-Agent (Android/iOS)
[![Pub](https://img.shields.io/pub/v/wv_user_agent.svg)](https://pub.dev/packages/wv_user_agent)
[![Android/iOS](https://img.shields.io/badge/Platform-Android\/iOS-blue.svg?longCache=true&style=flat-square)]()
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)

`wv_user_agent` is a simple Flutter plugin for retrieving **the actual user agent** of a device using the native WebView.

## ⚡ Features

- Retrieves the **actual user agent** string from the device's native WebView.
- Compatible with **Android** and **iOS**.
- Lightweight and **easy to use**.
- Works with the latest versions of **Flutter, Dart, Android Studio, and Xcode**.
- Inspired by [`fk_user_agent`](https://pub.dev/packages/fk_user_agent), but **simpler and more up-to-date**.

## ⚙️ Installation

This plugin is set the [Null Safety](https://flutter.dev/docs/null-safety).

### 1. From `pub.dev`

Run this command:
```shell
$ flutter pub add wv_user_agent
```

This will add a line like this to your package's `pubspec.yaml` (and run an implicit `flutter pub get`):

```yaml
dependencies:
  wv_user_agent: latest_version
```

Alternatively, your editor might support `flutter pub get`. Check the docs for your editor to learn more.

---

### 2. From `github.com`

Add this to your `pubspec.yaml`:
```yaml
dependencies:
  wv_user_agent:
    git:
      url: https://github.com/jakkimcfly/wv_user_agent.git
```

Then run:
```shell
$ flutter pub get
```

## 📥 Import it
Now in your Dart code, you can use:
```dart
import 'package:wv_user_agent/wv_user_agent.dart';
```

## 💥 Comparison: Default User Agent vs. `wv_user_agent`

| Source | Example User Agent |
| ------ | -------------------|
| **Default Flutter User-Agent** | Dart/3.2 (dart:io) |
| **User-Agent from `wv_user_agent`** |	Mozilla/5.0 (Linux; Android 13; Pixel 7 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.5481.153 Mobile Safari/537.36 |

## 🛠️ How it Works
* On Android, the plugin retrieves the user agent from [`WebView.settings.userAgentString`](https://developer.android.com/reference/android/webkit/WebSettings#getUserAgentString()).
* On iOS, the plugin evaluates JavaScript (`navigator.userAgent`) in a [`WKWebView`](https://developer.apple.com/documentation/webkit/wkwebview).


## 💡 Why use this plugin?

Normally, when loading web pages inside a Flutter app using [`webview_flutter`](https://pub.dev/packages/webview_flutter), the default user agent may not match the actual browser user agent. This can lead to issues such as:

* Websites detecting the app as a bot or crawler.
* Incorrect rendering of certain web pages.
* Blocking of specific features due to an unknown user agent.

With `wv_user_agent`, you get the actual user agent that a device's browser would use, ensuring correct web page behavior.

## 🚀 Example Usage

Below is an example showing how to use `wv_user_agent` to obtain the actual user agent and pass it to [`webview_flutter`](https://pub.dev/packages/webview_flutter), ensuring that web pages load with the correct user agent.

```dart
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

  // Fetches the actual User-Agent from the native WebView
  Future<void> _loadUserAgent() async {
    final ua = await WvUserAgent.userAgent;
    setState(() {
      _userAgent = ua;
    });

    // Initialize WebView with the fetched User-Agent
    _controller = WebViewController()
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
            Expanded(
              child: WebViewWidget(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 💬 Questions?

Feel free to [open an issue](https://github.com/jakkimcfly/wv_user_agent/issues/new/choose). 

## ✨ Support

If you like this project, give it a ⭐ and share it with friends!

<a href="https://www.buymeacoffee.com/jakkimcfly" target="_blank">
<img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 54px!important;">
</a>