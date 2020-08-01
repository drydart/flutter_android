/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterAndroidPlugin */
public class FlutterAndroidPlugin implements FlutterPlugin {

  /** Plugin registration. */
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
    assert(binding != null);

    final DartExecutor executor = binding.getFlutterEngine().getDartExecutor();
    assert(executor != null);

    (new MethodChannel(executor, ActivityManagerHandler.CHANNEL))
      .setMethodCallHandler(new ActivityManagerHandler(null)); // FIXME

    (new MethodChannel(executor, AndroidHandler.CHANNEL))
      .setMethodCallHandler(new AndroidHandler(null)); // FIXME

    (new MethodChannel(executor, BluetoothAdapterHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothAdapterHandler(null)); // FIXME

    (new MethodChannel(executor, BluetoothDeviceHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothDeviceHandler(null)); // FIXME

    (new MethodChannel(executor, BluetoothHeadsetHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothHeadsetHandler(null)); // FIXME

    (new MethodChannel(executor, BluetoothLeScannerHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothLeScannerHandler(null)); // FIXME

    (new MethodChannel(executor, BluetoothManagerHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothManagerHandler(null)); // FIXME

    (new MethodChannel(executor, ContextHandler.CHANNEL))
      .setMethodCallHandler(new ContextHandler(null)); // FIXME

    (new MethodChannel(executor, EnvironmentHandler.CHANNEL))
      .setMethodCallHandler(new EnvironmentHandler(null)); // FIXME

    (new MethodChannel(executor, FaceDetectorHandler.CHANNEL))
      .setMethodCallHandler(new FaceDetectorHandler(null)); // FIXME

    (new MethodChannel(executor, LocationHandler.CHANNEL))
      .setMethodCallHandler(new LocationHandler(null)); // FIXME

    (new MethodChannel(executor, SensorManagerHandler.CHANNEL))
      .setMethodCallHandler(new SensorManagerHandler(null)); // FIXME

    (new MethodChannel(executor, SharedPreferencesHandler.CHANNEL))
      .setMethodCallHandler(new SharedPreferencesHandler(null)); // FIXME
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    assert(binding != null);

    // TODO: channel.setMethodCallHandler(null);
  }
}
