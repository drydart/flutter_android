/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

import 'sensor.dart' show Sensor;

const MethodChannel _channel =
    MethodChannel('flutter_android/SensorManager');

/// [SensorManager] lets you access the device's sensors.
///
/// See: https://developer.android.com/reference/android/hardware/SensorManager
abstract class SensorManager {

  /// Gets the default sensor for a given type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager.html#getDefaultSensor(int)
  static Future<Sensor> getDefaultSensor(final int type) async {
    final Map<String, dynamic> request = <String, dynamic>{'type': type};
    final int key = await _channel.invokeMethod('getDefaultSensor', request);
    return (key == null) ? null : Sensor(
      key: key,
      name: null, // TODO
      type: type,
    );
  }
}
