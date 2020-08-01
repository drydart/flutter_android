/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;

/** BluetoothLeScannerHandler */
@SuppressWarnings("unchecked")
class BluetoothLeScannerHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/BluetoothLeScanner";

  BluetoothLeScannerHandler(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
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
