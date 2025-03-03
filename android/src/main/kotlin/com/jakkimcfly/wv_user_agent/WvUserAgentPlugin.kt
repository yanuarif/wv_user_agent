package com.jakkimcfly.wv_user_agent

import android.os.Build
import android.webkit.WebSettings
import android.webkit.WebView
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** WvUserAgentPlugin */
class WvUserAgentPlugin: FlutterPlugin, MethodCallHandler {
  
  private lateinit var channel : MethodChannel
  private lateinit var context: android.content.Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
		channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wv_user_agent")
		channel.setMethodCallHandler(this)
		context = flutterPluginBinding.applicationContext
  }

	override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {      
 		when (call.method) {
			"getUserAgent" -> {
				val userAgent = getUserAgent()
				result.success(userAgent)
			}
			else -> result.notImplemented()
    }
	}

  private fun getUserAgent(): String {
		return try {
			WebView(context).settings.userAgentString
		} catch (e: Exception) {
			WebSettings.getDefaultUserAgent(context)
		}
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
