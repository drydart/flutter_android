/* This is free and unencumbered software released into the public domain. */

import 'package:meta/meta.dart' show required;

import 'package:flutter/services.dart' show EventChannel;

import 'sensor_event.dart' show SensorEvent;
import 'sensor_manager.dart' show SensorManager;

/// Represents a sensor.
///
/// See: https://developer.android.com/reference/android/hardware/Sensor
class Sensor {
  /// A constant describing an accelerometer sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_ACCELEROMETER
  static const int TYPE_ACCELEROMETER = 1;

  /// A constant string describing an accelerometer sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_ACCELEROMETER
  static const String STRING_TYPE_ACCELEROMETER =
      "android.sensor.accelerometer";

  /// A constant describing a magnetic field sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_MAGNETIC_FIELD
  static const int TYPE_MAGNETIC_FIELD = 2;

  /// A constant string describing a magnetic field sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_MAGNETIC_FIELD
  static const String STRING_TYPE_MAGNETIC_FIELD =
      "android.sensor.magnetic_field";

  /// A constant describing a gyroscope sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_GYROSCOPE
  static const int TYPE_GYROSCOPE = 4;

  /// A constant string describing a gyroscope sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_GYROSCOPE
  static const String STRING_TYPE_GYROSCOPE = "android.sensor.gyroscope";

  /// A constant describing a light sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_LIGHT
  static const int TYPE_LIGHT = 5;

  /// A constant string describing a light sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_LIGHT
  static const String STRING_TYPE_LIGHT = "android.sensor.light";

  /// A constant describing a pressure sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_PRESSURE
  static const int TYPE_PRESSURE = 6;

  /// A constant string describing a pressure sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_PRESSURE
  static const String STRING_TYPE_PRESSURE = "android.sensor.pressure";

  /// A constant describing a proximity sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_PROXIMITY
  static const int TYPE_PROXIMITY = 8;

  /// A constant string describing a proximity sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_PROXIMITY
  static const String STRING_TYPE_PROXIMITY = "android.sensor.proximity";

  /// A constant describing a gravity sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_GRAVITY
  static const int TYPE_GRAVITY = 9;

  /// A constant string describing a gravity sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_GRAVITY
  static const String STRING_TYPE_GRAVITY = "android.sensor.gravity";

  /// A constant describing a linear acceleration sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_LINEAR_ACCELERATION
  static const int TYPE_LINEAR_ACCELERATION = 10;

  /// A constant string describing a linear acceleration sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_LINEAR_ACCELERATION
  static const String STRING_TYPE_LINEAR_ACCELERATION =
      "android.sensor.linear_acceleration";

  /// A constant describing a rotation vector sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_ROTATION_VECTOR
  static const int TYPE_ROTATION_VECTOR = 11;

  /// A constant string describing a rotation vector sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_ROTATION_VECTOR
  static const String STRING_TYPE_ROTATION_VECTOR =
      "android.sensor.rotation_vector";

  /// A constant describing a relative humidity sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_RELATIVE_HUMIDITY
  static const int TYPE_RELATIVE_HUMIDITY = 12;

  /// A constant string describing a relative humidity sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_RELATIVE_HUMIDITY
  static const String STRING_TYPE_RELATIVE_HUMIDITY =
      "android.sensor.relative_humidity";

  /// A constant describing an ambient temperature sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_AMBIENT_TEMPERATURE
  static const int TYPE_AMBIENT_TEMPERATURE = 13;

  /// A constant string describing an ambient temperature sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_AMBIENT_TEMPERATURE
  static const String STRING_TYPE_AMBIENT_TEMPERATURE =
      "android.sensor.ambient_temperature";

  /// A constant describing an uncalibrated magnetic field sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_MAGNETIC_FIELD_UNCALIBRATED
  static const int TYPE_MAGNETIC_FIELD_UNCALIBRATED = 14;

  /// A constant string describing an uncalibrated magnetic field sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_MAGNETIC_FIELD_UNCALIBRATED
  static const String STRING_TYPE_MAGNETIC_FIELD_UNCALIBRATED =
      "android.sensor.magnetic_field_uncalibrated";

  /// A constant describing an uncalibrated rotation vector sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_GAME_ROTATION_VECTOR
  static const int TYPE_GAME_ROTATION_VECTOR = 15;

  /// A constant string describing an uncalibrated rotation vector sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_GAME_ROTATION_VECTOR
  static const String STRING_TYPE_GAME_ROTATION_VECTOR =
      "android.sensor.game_rotation_vector";

  /// A constant describing an uncalibrated gyroscope sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_GYROSCOPE_UNCALIBRATED
  static const int TYPE_GYROSCOPE_UNCALIBRATED = 16;

  /// A constant string describing an uncalibrated gyroscope sensor type.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_GYROSCOPE_UNCALIBRATED
  static const String STRING_TYPE_GYROSCOPE_UNCALIBRATED =
      "android.sensor.gyroscope_uncalibrated";

  /// A constant describing a significant motion trigger sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_SIGNIFICANT_MOTION
  static const int TYPE_SIGNIFICANT_MOTION = 17;

  /// A constant string describing a significant motion trigger sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_SIGNIFICANT_MOTION
  static const String STRING_TYPE_SIGNIFICANT_MOTION =
      "android.sensor.significant_motion";

  /// A constant describing a step detector sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_STEP_DETECTOR
  static const int TYPE_STEP_DETECTOR = 18;

  /// A constant string describing a step detector sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_STEP_DETECTOR
  static const String STRING_TYPE_STEP_DETECTOR =
      "android.sensor.step_detector";

  /// A constant describing a step counter sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_STEP_COUNTER
  static const int TYPE_STEP_COUNTER = 19;

  /// A constant string describing a step counter sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_STEP_COUNTER
  static const String STRING_TYPE_STEP_COUNTER = "android.sensor.step_counter";

  /// A constant describing a geo-magnetic rotation vector.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_GEOMAGNETIC_ROTATION_VECTOR
  static const int TYPE_GEOMAGNETIC_ROTATION_VECTOR = 20;

  /// A constant string describing a geo-magnetic rotation vector.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_GEOMAGNETIC_ROTATION_VECTOR
  static const String STRING_TYPE_GEOMAGNETIC_ROTATION_VECTOR =
      "android.sensor.geomagnetic_rotation_vector";

  /// A constant describing a heart rate monitor.
  ///
  /// The reported value is the heart rate in beats per minute.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_HEART_RATE
  static const int TYPE_HEART_RATE = 21;

  /// A constant string describing a heart rate monitor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_HEART_RATE
  static const String STRING_TYPE_HEART_RATE = "android.sensor.heart_rate";

  /// A constant describing a pose sensor with 6 degrees of freedom.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_POSE_6DOF
  static const int TYPE_POSE_6DOF = 28;

  /// A constant string describing a pose sensor with 6 degrees of freedom.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_POSE_6DOF
  static const String STRING_TYPE_POSE_6DOF = "android.sensor.pose_6dof";

  /// A constant describing a stationary detect sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_STATIONARY_DETECT
  static const int TYPE_STATIONARY_DETECT = 29;

  /// A constant string describing a stationary detection sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_STATIONARY_DETECT
  static const String STRING_TYPE_STATIONARY_DETECT =
      "android.sensor.stationary_detect";

  /// A constant describing a motion detect sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_MOTION_DETECT
  static const int TYPE_MOTION_DETECT = 30;

  /// A constant string describing a motion detection sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_MOTION_DETECT
  static const String STRING_TYPE_MOTION_DETECT =
      "android.sensor.motion_detect";

  /// A constant describing a motion detect sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_HEART_BEAT
  static const int TYPE_HEART_BEAT = 31;

  /// A constant string describing a heart beat sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_HEART_BEAT
  static const String STRING_TYPE_HEART_BEAT = "android.sensor.heart_beat";

  /// A constant describing a low latency off-body detect sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_LOW_LATENCY_OFFBODY_DETECT
  static const int TYPE_LOW_LATENCY_OFFBODY_DETECT = 34;

  /// A constant string describing a low-latency offbody detector sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_LOW_LATENCY_OFFBODY_DETECT
  static const String STRING_TYPE_LOW_LATENCY_OFFBODY_DETECT =
      "android.sensor.low_latency_offbody_detect";

  /// A constant describing an uncalibrated accelerometer sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_ACCELEROMETER_UNCALIBRATED
  static const int TYPE_ACCELEROMETER_UNCALIBRATED = 35;

  /// A constant string describing an uncalibrated accelerometer sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#STRING_TYPE_ACCELEROMETER_UNCALIBRATED
  static const String STRING_TYPE_ACCELEROMETER_UNCALIBRATED =
      "android.sensor.accelerometer_uncalibrated";

  /// A constant describing all sensor types.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_ALL
  static const int TYPE_ALL = -1;

  /// The lowest sensor type vendor defined sensors can use.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#TYPE_DEVICE_PRIVATE_BASE
  static const int TYPE_DEVICE_PRIVATE_BASE = 65536;

  /// Events are reported at a constant rate which is set by the rate parameter
  /// of `SensorManager#registerListener(SensorEventListener, Sensor, int)`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#REPORTING_MODE_CONTINUOUS
  static const int REPORTING_MODE_CONTINUOUS = 0;

  /// Events are reported only when the value changes.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#REPORTING_MODE_ON_CHANGE
  static const int REPORTING_MODE_ON_CHANGE = 1;

  /// Events are reported in one-shot mode.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#REPORTING_MODE_ONE_SHOT
  static const int REPORTING_MODE_ONE_SHOT = 2;

  /// Events are reported as described in the description of the sensor.
  ///
  /// See: https://developer.android.com/reference/android/hardware/Sensor#REPORTING_MODE_SPECIAL_TRIGGER
  static const int REPORTING_MODE_SPECIAL_TRIGGER = 3;

  /// An internal handle.
  final int key;

  /// See: https://developer.android.com/reference/android/hardware/Sensor#getName()
  final String name;

  /// See: https://developer.android.com/reference/android/hardware/Sensor#getType()
  final int type;

  const Sensor({
    @required this.key,
    this.name,
    this.type,
  });

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
