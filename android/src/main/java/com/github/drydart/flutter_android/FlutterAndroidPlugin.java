/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterAndroidPlugin */
public class FlutterAndroidPlugin {

  /** Plugin registration. */
  public static void registerWith(final Registrar registrar) {
    assert(registrar != null);

    (new MethodChannel(registrar.messenger(), AndroidMethodHandler.CHANNEL))
      .setMethodCallHandler(new AndroidMethodHandler());
  }
}
