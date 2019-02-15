/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

/// [SensorManager] lets you access the device's sensors.
///
/// See: https://developer.android.com/reference/android/hardware/SensorManager
abstract class SensorManager {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/SensorManager');
}
