/* This is free and unencumbered software released into the public domain. */

import 'package:meta/meta.dart' show required;

import 'package:flutter/services.dart' show EventChannel, MethodChannel;

import 'sensor_event.dart' show SensorEvent;
import 'sensor_manager.dart' show SensorManager;

/// Represents a sensor.
///
/// See: https://developer.android.com/reference/android/hardware/Sensor
class Sensor {
  /// An internal handle.
  final int key;

  /// See: https://developer.android.com/reference/android/hardware/Sensor.html#getName()
  final String name;

  /// See: https://developer.android.com/reference/android/hardware/Sensor.html#getType()
  final int type;

  const Sensor({
    @required this.key,
    this.name,
    this.type,
  });

  /// A constant describing a motion detect sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_HEART_BEAT
  static const int TYPE_HEART_BEAT = 31;

  /// A constant describing a heart rate monitor.
  ///
  /// The reported value is the heart rate in beats per minute.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_HEART_RATE
  static const int TYPE_HEART_RATE = 21;

  /// Subscribes to this sensor's event stream.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#registerListener(android.hardware.SensorEventListener,%20android.hardware.Sensor,%20int)
  Future<Stream<SensorEvent>> subscribe(
      {int samplingPeriodUs, int maxReportLatencyUs}) async {
    final EventChannel events = await SensorManager.registerListener(this,
        samplingPeriodUs: samplingPeriodUs,
        maxReportLatencyUs: maxReportLatencyUs);
    return events.receiveBroadcastStream().map(
        (dynamic event) => _streamEventToSensorEvent(event.cast<double>()));
  }

  @override
  String toString() => '[Sensor (type: $type)]';

  SensorEvent _streamEventToSensorEvent(final List<double> list) {
    return SensorEvent(
      accuracy: null, // TODO
      sensor: this,
      timestamp: null, // TODO
      values: list,
    );
  }
}
