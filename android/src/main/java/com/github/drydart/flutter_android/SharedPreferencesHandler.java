/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.Context;
import android.content.SharedPreferences;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SharedPreferencesHandler */
@SuppressWarnings("unchecked")
class SharedPreferencesHandler implements MethodCallHandler {
  static final String CHANNEL = "flutter_android/SharedPreferences";

  final Registrar registrar;

  SharedPreferencesHandler(final Registrar registrar) {
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

  private static <T> T
  getRequiredArgument(final MethodCall call,
                      final String name) {
    assert(call != null);
    assert(name != null);

    if (!call.hasArgument(name)) {
      throw new AssertionError();
    }
    final T arg = call.argument(name);
    if (arg == null) {
      throw new AssertionError();
    }
    return arg;
  }

  private static <T> T
  getOptionalArgument(final MethodCall call,
                      final String name) {
    return getOptionalArgument(call, name, (T)null);
  }

  private static <T> T
  getOptionalArgument(final MethodCall call,
                      final String name,
                      final T defaultValue) {
    assert(call != null);
    assert(name != null);

    return call.hasArgument(name) ? (T)call.argument(name) : defaultValue;
  }
}
