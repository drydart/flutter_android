/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.location.Location;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** LocationHandler */
@SuppressWarnings("unchecked")
class LocationHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/Location";

  LocationHandler(final Registrar registrar) {
    super(registrar);
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {
      case "distanceBetween": {
        final double startLatitude = getRequiredArgument(call, "startLatitude");
        final double startLongitude = getRequiredArgument(call, "startLongitude");
        final double endLatitude = getRequiredArgument(call, "endLatitude");
        final double endLongitude = getRequiredArgument(call, "endLongitude");
        final float[] distance = new float[1];
        Location.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude, distance);
        result.success((double)distance[0]);
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }
}
