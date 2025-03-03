import Flutter
import UIKit
import WebKit

public class WvUserAgentPlugin: NSObject, FlutterPlugin {
  
  private var webView: WKWebView?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "wv_user_agent", binaryMessenger: registrar.messenger())
    let instance = WvUserAgentPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getUserAgent":
      getUserAgent { userAgent in
        result(userAgent)
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func getUserAgent(completion: @escaping (String) -> Void) {
    DispatchQueue.main.async {
      self.webView = WKWebView(frame: .zero)
      self.webView?.evaluateJavaScript("navigator.userAgent") { (userAgent, error) in
        if let ua = userAgent as? String {
            completion(ua)
        } else {
            completion("Failed to get User-Agent")
        }
        self.webView = nil
      }
    }
  }
}
