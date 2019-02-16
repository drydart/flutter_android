/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import java.util.HashMap;
import java.util.Map;

/** SensorManagerHandler */
@SuppressWarnings("unchecked")
class SensorManagerHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/SensorManager";

  private final Map<Integer, Sensor> sensors = new HashMap<>();
  private final Map<Integer, EventChannel> channels = new HashMap<>();

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
        final int sensorKey = sensorType; // for now
        if (this.sensors.containsKey(sensorKey)) {
          result.success(sensorKey);
          break;
        }
        final Context context = registrar.context();
        final SensorManager sensorManager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
        final Sensor sensor = sensorManager.getDefaultSensor(sensorType);
        if (sensor == null) {
          result.success(null);
          break;
        }
        this.sensors.put(sensorKey, sensor);
        result.success(sensorType);
        break;
      }

      /* Instance methods */

      case "registerListener": {
        final int sensorKey = getRequiredArgument(call, "key");
        if (this.channels.containsKey(sensorKey)) {
          final String channelID = String.valueOf(sensorKey);
          result.success(channelID); // already registered
          break;
        }
        if (!this.sensors.containsKey(sensorKey)) {
          result.success(null); // invalid sensor key
          break;
        }
        final int samplingPeriodUs = getOptionalArgument(call, "samplingPeriodUs", SensorManager.SENSOR_DELAY_NORMAL);
        final int maxReportLatencyUs = getOptionalArgument(call, "maxReportLatencyUs", 0);
        final Context context = registrar.context();
        final SensorManager sensorManager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
        final Sensor sensor = this.sensors.get(sensorKey);
        final String channelID = String.valueOf(sensorKey);
        final EventChannel channel = new EventChannel(registrar.messenger(), String.format("%s/%d", CHANNEL, sensorKey));
        channel.setStreamHandler(new SensorEventStream(sensorManager, sensor, samplingPeriodUs, maxReportLatencyUs));
        this.channels.put(sensorKey, channel);
        result.success(channelID);
        break;
      }

      case "unregisterListener": {
        // TODO
        break;
      }

      default: {
        result.notImplemented();
      }
    }
  }
}
