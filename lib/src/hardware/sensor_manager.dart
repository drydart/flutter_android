/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show EventChannel, MethodChannel;

import 'sensor.dart' show Sensor;

const MethodChannel _channel = MethodChannel('flutter_android/SensorManager');

/// [SensorManager] lets you access the device's sensors.
///
/// See: https://developer.android.com/reference/android/hardware/SensorManager
abstract class SensorManager {
  /// Gets the default sensor for a given type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#getDefaultSensor(int)
  static Future<Sensor> getDefaultSensor(final int type) async {
    final Map<String, dynamic> request = <String, dynamic>{'type': type};
    final int key = await _channel.invokeMethod('getDefaultSensor', request);
    return (key == null)
        ? null
        : Sensor(
            key: key,
            name: null, // TODO
            type: type,
          );
  }

  /// Registers a [SensorEvent] listener for the given sensor at the given
  /// sampling frequency and the given maximum reporting latency.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#registerListener(android.hardware.SensorEventListener,%20android.hardware.Sensor,%20int,%20int)
  static Future<EventChannel> registerListener(final Sensor sensor,
      {int samplingPeriodUs, int maxReportLatencyUs}) async {
    assert(sensor.key != null);
    final Map<String, dynamic> request = <String, dynamic>{
      'key': sensor.key,
      'samplingPeriodUs': samplingPeriodUs,
      'maxReportLatencyUs': maxReportLatencyUs,
    };
    final String channelID =
        await _channel.invokeMethod('registerListener', request);
    return (channelID != null)
        ? EventChannel('flutter_android/SensorManager/$channelID')
        : null;
  }
}
