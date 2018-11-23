/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.app.ActivityManager;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ActivityManagerMethodHandler */
class ActivityManagerMethodHandler implements MethodCallHandler {
  static final String CHANNEL = "flutter_android/ActivityManager";

  final Registrar registrar;

  ActivityManagerMethodHandler(final Registrar registrar) {
    this.registrar = registrar;
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {
      case "isRunningInTestHarness": {
        result.success(ActivityManager.isRunningInTestHarness());
        break;
      }
      default: {
        result.notImplemented();
      }
    }
  }
}
