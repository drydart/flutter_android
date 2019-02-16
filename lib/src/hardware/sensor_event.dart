/* This is free and unencumbered software released into the public domain. */

import 'sensor.dart' show Sensor;

/// Represents a [Sensor] event and holds information such as the sensor's type,
/// the time-stamp, accuracy and of course the sensor's data.
///
/// See: https://developer.android.com/reference/android/hardware/SensorEvent
class SensorEvent {
  /// The accuracy of this event.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorEvent.html#accuracy
  final int accuracy;

  /// The sensor that generated this event.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorEvent.html#sensor
  final Sensor sensor;

  /// The time in nanoseconds at which the event happened.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorEvent.html#timestamp
  final int timestamp;

  /// The length and contents of the values array depends on which sensor type
  /// is being monitored.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorEvent.html#values
  final List<double> values;

  const SensorEvent({
    this.accuracy,
    this.sensor,
    this.timestamp,
    this.values,
  });
}
