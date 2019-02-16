/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import io.flutter.plugin.common.EventChannel;

/** SensorEventStream */
class SensorEventStream implements EventChannel.StreamHandler {
  private final SensorManager sensorManager;
  private final Sensor sensor;
  private final int samplingPeriodUs;
  private final int maxReportLatencyUs;
  private SensorEventListener sensorEventListener;

  SensorEventStream(final SensorManager sensorManager,
                    final Sensor sensor,
                    final int samplingPeriodUs,
                    final int maxReportLatencyUs) {
    this.sensorManager = sensorManager;
    this.sensor = sensor;
    this.samplingPeriodUs = samplingPeriodUs;
    this.maxReportLatencyUs = maxReportLatencyUs;
  }

  @Override
  public void onListen(final Object _arguments, final EventChannel.EventSink events) {
    this.sensorEventListener = createSensorEventListener(events);
    this.sensorManager.registerListener(this.sensorEventListener,
        this.sensor, this.samplingPeriodUs, this.maxReportLatencyUs);
  }

  @Override
  public void onCancel(final Object _arguments) {
    this.sensorManager.unregisterListener(this.sensorEventListener);
  }

  SensorEventListener createSensorEventListener(final EventChannel.EventSink events) {
    return new SensorEventListener() {
      @Override
      public void onAccuracyChanged(final Sensor sensor, final int accuracy) {}

      @Override
      public void onSensorChanged(final SensorEvent event) {
        double[] sensorValues = new double[event.values.length];
        for (int i = 0; i < event.values.length; i++) {
          sensorValues[i] = event.values[i];
        }
        events.success(sensorValues);
      }
    };
  }
}
