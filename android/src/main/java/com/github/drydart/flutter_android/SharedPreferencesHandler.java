/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.Context;
import android.content.SharedPreferences;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;

/** SharedPreferencesHandler */
class SharedPreferencesHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/SharedPreferences";

  SharedPreferencesHandler(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
    super(binding);
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    final Context context = this.binding.getApplicationContext();
    assert(context != null);

    assert(call.method != null);
    switch (call.method) {
      case "getAll": {
        final String name = getRequiredArgument(call, "name");
        final int mode = getRequiredArgument(call, "mode");
        final SharedPreferences prefs = context.getSharedPreferences(name, mode);
        result.success(prefs.getAll());
        break;
      }
      default: {
        result.notImplemented();
      }
    }
  }
}
