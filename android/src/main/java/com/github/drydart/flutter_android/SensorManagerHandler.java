/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.HashMap;
import java.util.Map;

/** SensorManagerHandler */
@SuppressWarnings("unchecked")
class SensorManagerHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/SensorManager";

  final Map<Integer, Sensor> sensors = new HashMap<>();

  SensorManagerHandler(final Registrar registrar) {
    super(registrar);
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {
      /* Static methods */

      case "getDefaultSensor": {
        final int sensorType = getRequiredArgument(call, "type");
        if (this.sensors.containsKey(sensorType)) {
          result.success(sensorType);
          break;
        }
        final Context context = registrar.context();
        final SensorManager sensorManager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
        final Sensor sensor = sensorManager.getDefaultSensor(sensorType);
        if (sensor == null) {
          result.success(null);
          break;
        }
        this.sensors.put(sensorType, sensor);
        result.success(sensorType);
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }
}
