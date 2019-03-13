/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show EventChannel, MethodChannel;

import 'sensor.dart' show Sensor;

const MethodChannel _channel = MethodChannel('flutter_android/SensorManager');

/// [SensorManager] lets you access the device's sensors.
///
/// See: https://developer.android.com/reference/android/hardware/SensorManager
abstract class SensorManager {
  /// Standard gravity (g) on Earth.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#STANDARD_GRAVITY
  static const double STANDARD_GRAVITY = 9.80665;

  /// Sun's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_SUN
  static const double GRAVITY_SUN = 275.0;

  /// Mercury's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_MERCURY
  static const double GRAVITY_MERCURY = 3.7;

  /// Venus' gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_VENUS
  static const double GRAVITY_VENUS = 8.87;

  /// Earth's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_EARTH
  static const double GRAVITY_EARTH = 9.80665;

  /// The Moon's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_MOON
  static const double GRAVITY_MOON = 1.6;

  /// Mars' gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_MARS
  static const double GRAVITY_MARS = 3.71;

  /// Jupiter's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_JUPITER
  static const double GRAVITY_JUPITER = 23.12;

  /// Saturn's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_SATURN
  static const double GRAVITY_SATURN = 8.96;

  /// Uranus' gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_URANUS
  static const double GRAVITY_URANUS = 8.69;

  /// Neptune's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_NEPTUNE
  static const double GRAVITY_NEPTUNE = 11.0;

  /// Pluto's gravity in SI units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_PLUTO
  static const double GRAVITY_PLUTO = 0.6;

  /// Gravity (estimate) on the first Death Star in Empire units (m/s^2).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_DEATH_STAR_I
  static const double GRAVITY_DEATH_STAR_I = 3.53036145e-07;

  /// Gravity on the island.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#GRAVITY_THE_ISLAND
  static const double GRAVITY_THE_ISLAND = 4.815162342;

  /// Maximum magnetic field on Earth's surface.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#MAGNETIC_FIELD_EARTH_MAX
  static const double MAGNETIC_FIELD_EARTH_MAX = 60.0;

  /// Minimum magnetic field on Earth's surface.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#MAGNETIC_FIELD_EARTH_MIN
  static const double MAGNETIC_FIELD_EARTH_MIN = 30.0;

  /// Standard atmosphere, or average sea-level pressure in hPa (millibar).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#PRESSURE_STANDARD_ATMOSPHERE
  static const double PRESSURE_STANDARD_ATMOSPHERE = 1013.25;

  /// Maximum luminance of sunlight in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_SUNLIGHT_MAX
  static const double LIGHT_SUNLIGHT_MAX = 120000.0;

  /// luminance of sunlight in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_SUNLIGHT
  static const double LIGHT_SUNLIGHT = 110000.0;

  /// luminance in shade in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_SHADE
  static const double LIGHT_SHADE = 20000.0;

  /// luminance under an overcast sky in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_OVERCAST
  static const double LIGHT_OVERCAST = 10000.0;

  /// luminance at sunrise in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_SUNRISE
  static const double LIGHT_SUNRISE = 400.0;

  /// luminance under a cloudy sky in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_CLOUDY
  static const double LIGHT_CLOUDY = 100.0;

  /// luminance at night with full moon in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_FULLMOON
  static const double LIGHT_FULLMOON = 0.25;

  /// luminance at night with no moon in lux.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#LIGHT_NO_MOON
  static const double LIGHT_NO_MOON = 0.001;

  /// get sensor data as fast as possible.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_DELAY_FASTEST
  static const int SENSOR_DELAY_FASTEST = 0;

  /// rate suitable for games.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_DELAY_GAME
  static const int SENSOR_DELAY_GAME = 1;

  /// rate suitable for the user interface.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_DELAY_UI
  static const int SENSOR_DELAY_UI = 2;

  /// rate (default) suitable for screen orientation changes.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_DELAY_NORMAL
  static const int SENSOR_DELAY_NORMAL = 3;

  /// The values returned by this sensor cannot be trusted because the sensor
  /// had no contact with what it was measuring (for example, the heart rate
  /// monitor is not in contact with the user).
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_STATUS_NO_CONTACT
  static const int SENSOR_STATUS_NO_CONTACT = -1;

  /// The values returned by this sensor cannot be trusted, calibration is
  /// needed or the environment doesn't allow readings.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_STATUS_UNRELIABLE
  static const int SENSOR_STATUS_UNRELIABLE = 0;

  /// This sensor is reporting data with low accuracy, calibration with the
  /// environment is needed.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_STATUS_ACCURACY_LOW
  static const int SENSOR_STATUS_ACCURACY_LOW = 1;

  /// This sensor is reporting data with an average level of accuracy,
  /// calibration with the environment may improve the readings.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_STATUS_ACCURACY_MEDIUM
  static const int SENSOR_STATUS_ACCURACY_MEDIUM = 2;

  /// This sensor is reporting data with maximum accuracy.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#SENSOR_STATUS_ACCURACY_HIGH
  static const int SENSOR_STATUS_ACCURACY_HIGH = 3;

  /// see `remapCoordinateSystem`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#AXIS_X
  static const int AXIS_X = 1;

  /// see `remapCoordinateSystem`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#AXIS_Y
  static const int AXIS_Y = 2;

  /// see `remapCoordinateSystem`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#AXIS_Z
  static const int AXIS_Z = 3;

  /// see `remapCoordinateSystem`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#AXIS_MINUS_X
  static const int AXIS_MINUS_X = 129;

  /// see `remapCoordinateSystem`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#AXIS_MINUS_Y
  static const int AXIS_MINUS_Y = 130;

  /// see `remapCoordinateSystem`.
  ///
  /// See: https://developer.android.com/reference/android/hardware/SensorManager#AXIS_MINUS_Z
  static const int AXIS_MINUS_Z = 131;

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
