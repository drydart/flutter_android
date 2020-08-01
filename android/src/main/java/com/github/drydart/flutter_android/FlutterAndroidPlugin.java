/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterAndroidPlugin */
public class FlutterAndroidPlugin implements FlutterPlugin {

  /** Plugin registration. */
  @Override
  public void onAttachedToEngine(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
    assert(binding != null);

    final BinaryMessenger messenger = binding.getBinaryMessenger();
    assert(messenger != null);

    (new MethodChannel(messenger, ActivityManagerHandler.CHANNEL))
      .setMethodCallHandler(new ActivityManagerHandler(binding));

    (new MethodChannel(messenger, AndroidHandler.CHANNEL))
      .setMethodCallHandler(new AndroidHandler(binding));

    (new MethodChannel(messenger, BluetoothAdapterHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothAdapterHandler(binding));

    (new MethodChannel(messenger, BluetoothDeviceHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothDeviceHandler(binding));

    (new MethodChannel(messenger, BluetoothHeadsetHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothHeadsetHandler(binding));

    (new MethodChannel(messenger, BluetoothLeScannerHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothLeScannerHandler(binding));

    (new MethodChannel(messenger, BluetoothManagerHandler.CHANNEL))
      .setMethodCallHandler(new BluetoothManagerHandler(binding));

    (new MethodChannel(messenger, ContextHandler.CHANNEL))
      .setMethodCallHandler(new ContextHandler(binding));

    (new MethodChannel(messenger, EnvironmentHandler.CHANNEL))
      .setMethodCallHandler(new EnvironmentHandler(binding));

    (new MethodChannel(messenger, FaceDetectorHandler.CHANNEL))
      .setMethodCallHandler(new FaceDetectorHandler(binding));

    (new MethodChannel(messenger, LocationHandler.CHANNEL))
      .setMethodCallHandler(new LocationHandler(binding));

    (new MethodChannel(messenger, SensorManagerHandler.CHANNEL))
      .setMethodCallHandler(new SensorManagerHandler(binding));

    (new MethodChannel(messenger, SharedPreferencesHandler.CHANNEL))
      .setMethodCallHandler(new SharedPreferencesHandler(binding));
  }

  @Override
  public void onDetachedFromEngine(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
    assert(binding != null);

    // TODO: channel.setMethodCallHandler(null);
  }
}
