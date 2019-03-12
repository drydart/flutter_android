/* This is free and unencumbered software released into the public domain. */

/// Provides a mechanism of accessing hardware state of a device: CPU, GPU and
/// battery temperatures, CPU usage per core, fan speed, etc.
///
/// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager
abstract class HardwarePropertiesManager {

  /// Temperature of CPUs in Celsius.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#DEVICE_TEMPERATURE_CPU
  static const int DEVICE_TEMPERATURE_CPU = 0;

  /// Temperature of GPUs in Celsius.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#DEVICE_TEMPERATURE_GPU
  static const int DEVICE_TEMPERATURE_GPU = 1;

  /// Temperature of battery in Celsius.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#DEVICE_TEMPERATURE_BATTERY
  static const int DEVICE_TEMPERATURE_BATTERY = 2;

  /// Temperature of device skin in Celsius.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#DEVICE_TEMPERATURE_SKIN
  static const int DEVICE_TEMPERATURE_SKIN = 3;

  /// Get current temperature.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#TEMPERATURE_CURRENT
  static const int TEMPERATURE_CURRENT = 0;

  /// Get throttling temperature threshold.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#TEMPERATURE_THROTTLING
  static const int TEMPERATURE_THROTTLING = 1;

  /// Get shutdown temperature threshold.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#TEMPERATURE_SHUTDOWN
  static const int TEMPERATURE_SHUTDOWN = 2;

  /// Get throttling temperature threshold above which minimum clockrates for VR mode will not be met.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#TEMPERATURE_THROTTLING_BELOW_VR_MIN
  static const int TEMPERATURE_THROTTLING_BELOW_VR_MIN = 3;

  /// Undefined temperature constant.
  ///
  /// See: https://developer.android.com/reference/android/os/HardwarePropertiesManager#UNDEFINED_TEMPERATURE
  static const double UNDEFINED_TEMPERATURE = -3.4028235E38;
}
