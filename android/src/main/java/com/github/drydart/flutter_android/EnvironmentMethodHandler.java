/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.os.Environment;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** EnvironmentMethodHandler */
class EnvironmentMethodHandler implements MethodCallHandler {
  static final String CHANNEL = "flutter_android/Environment";

  final Registrar registrar;

  EnvironmentMethodHandler(final Registrar registrar) {
    this.registrar = registrar;
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    final Environment env = new Environment();
    assert(env != null);

    assert(call.method != null);
    switch (call.method) {
      case "getDataDirectory": {
        result.success(env.getDataDirectory().toString());
        break;
      }
      case "getDownloadCacheDirectory": {
        result.success(env.getDownloadCacheDirectory().toString());
        break;
      }
      case "getExternalStorageDirectory": {
        result.success(env.getExternalStorageDirectory().toString());
        break;
      }
      case "getExternalStorageState": {
        result.success(env.getExternalStorageState().toString());
        break;
      }
      case "getRootDirectory": {
        result.success(env.getRootDirectory().toString());
        break;
      }
      case "isExternalStorageEmulated": {
        result.success(env.isExternalStorageEmulated());
        break;
      }
      case "isExternalStorageRemovable": {
        result.success(env.isExternalStorageRemovable());
        break;
      }
      default: {
        result.notImplemented();
      }
    }
  }
}
