/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.Context;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ContextMethodHandler */
class ContextMethodHandler implements MethodCallHandler {
  static final String CHANNEL = "flutter_android/Context";

  final Registrar registrar;

  ContextMethodHandler(final Registrar registrar) {
    this.registrar = registrar;
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    final Context context = registrar.context();
    assert(context != null);

    assert(call.method != null);
    switch (call.method) {
      case "getCacheDir":
        result.success(context.getCacheDir().toString());
        break;
      case "getCodeCacheDir":
        result.success(context.getCodeCacheDir().toString());
        break;
      case "getDataDir":
        result.success(context.getDataDir().toString());
        break;
      case "getExternalCacheDir":
        result.success(context.getExternalCacheDir().toString());
        break;
      case "getExternalFilesDir":
        result.success(context.getExternalFilesDir(null).toString());
        break;
      case "getFilesDir":
        result.success(context.getFilesDir().toString());
        break;
      case "getNoBackupFilesDir":
        result.success(context.getNoBackupFilesDir().toString());
        break;
      case "getPackageCodePath":
        result.success(context.getPackageCodePath().toString());
        break;
      case "getPackageName":
        result.success(context.getPackageName().toString());
        break;
      case "getPackageResourcePath":
        result.success(context.getPackageResourcePath().toString());
        break;
      default:
        result.notImplemented();
    }
  }
}
