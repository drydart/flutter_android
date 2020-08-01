/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;

/** BluetoothAdapterHandler */
@SuppressWarnings("unchecked")
class BluetoothAdapterHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/BluetoothAdapter";

  BluetoothAdapterHandler(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
   super(binding);
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {
      // TODO

      default: {
        result.notImplemented();
      }
    }
  }
}
