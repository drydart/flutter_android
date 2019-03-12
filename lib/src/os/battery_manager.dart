/* This is free and unencumbered software released into the public domain. */

/// This class provides a method for querying battery and charging properties.
///
/// See: https://developer.android.com/reference/android/os/BatteryManager
abstract class BatteryManager {
  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer containing the current status constant.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_STATUS
  static const String EXTRA_STATUS = "status";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer containing the current health constant.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_HEALTH
  static const String EXTRA_HEALTH = "health";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: boolean indicating whether a battery is present.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_PRESENT
  static const String EXTRA_PRESENT = "present";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer field containing the current battery level, from 0 to `EXTRA_SCALE`.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_LEVEL
  static const String EXTRA_LEVEL = "level";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: Boolean field indicating whether the battery is currently considered to be low, that is whether a `Intent#ACTION_BATTERY_LOW` broadcast has been sent.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_BATTERY_LOW
  static const String EXTRA_BATTERY_LOW = "battery_low";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer containing the maximum battery level.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_SCALE
  static const String EXTRA_SCALE = "scale";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer containing the resource ID of a small status bar icon indicating the current battery state.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_ICON_SMALL
  static const String EXTRA_ICON_SMALL = "icon-small";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer indicating whether the device is plugged in to a power source; 0 means it is on battery, other constants are different types of power sources.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_PLUGGED
  static const String EXTRA_PLUGGED = "plugged";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer containing the current battery voltage level.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_VOLTAGE
  static const String EXTRA_VOLTAGE = "voltage";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: integer containing the current battery temperature.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_TEMPERATURE
  static const String EXTRA_TEMPERATURE = "temperature";

  /// Extra for `android.content.Intent#ACTION_BATTERY_CHANGED`: String describing the technology of the current battery.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#EXTRA_TECHNOLOGY
  static const String EXTRA_TECHNOLOGY = "technology";

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_STATUS_UNKNOWN
  static const int BATTERY_STATUS_UNKNOWN = 1;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_STATUS_CHARGING
  static const int BATTERY_STATUS_CHARGING = 2;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_STATUS_DISCHARGING
  static const int BATTERY_STATUS_DISCHARGING = 3;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_STATUS_NOT_CHARGING
  static const int BATTERY_STATUS_NOT_CHARGING = 4;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_STATUS_FULL
  static const int BATTERY_STATUS_FULL = 5;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_UNKNOWN
  static const int BATTERY_HEALTH_UNKNOWN = 1;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_GOOD
  static const int BATTERY_HEALTH_GOOD = 2;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_OVERHEAT
  static const int BATTERY_HEALTH_OVERHEAT = 3;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_DEAD
  static const int BATTERY_HEALTH_DEAD = 4;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_OVER_VOLTAGE
  static const int BATTERY_HEALTH_OVER_VOLTAGE = 5;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_UNSPECIFIED_FAILURE
  static const int BATTERY_HEALTH_UNSPECIFIED_FAILURE = 6;

  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_HEALTH_COLD
  static const int BATTERY_HEALTH_COLD = 7;

  /// Power source is an AC charger.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PLUGGED_AC
  static const int BATTERY_PLUGGED_AC = 1;

  /// Power source is a USB port.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PLUGGED_USB
  static const int BATTERY_PLUGGED_USB = 2;

  /// Power source is wireless.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PLUGGED_WIRELESS
  static const int BATTERY_PLUGGED_WIRELESS = 4;

  /// Sent when the device's battery has started charging (or has reached full charge and the device is on power).
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#ACTION_CHARGING
  static const String ACTION_CHARGING = "android.os.action.CHARGING";

  /// Sent when the device's battery may be discharging, so apps should avoid doing extraneous work that would cause it to discharge faster.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#ACTION_DISCHARGING
  static const String ACTION_DISCHARGING = "android.os.action.DISCHARGING";

  /// Battery capacity in microampere-hours, as an integer.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PROPERTY_CHARGE_COUNTER
  static const int BATTERY_PROPERTY_CHARGE_COUNTER = 1;

  /// Instantaneous battery current in microamperes, as an integer.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PROPERTY_CURRENT_NOW
  static const int BATTERY_PROPERTY_CURRENT_NOW = 2;

  /// Average battery current in microamperes, as an integer.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PROPERTY_CURRENT_AVERAGE
  static const int BATTERY_PROPERTY_CURRENT_AVERAGE = 3;

  /// Remaining battery capacity as an integer percentage of total capacity (with no fractional part).
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PROPERTY_CAPACITY
  static const int BATTERY_PROPERTY_CAPACITY = 4;

  /// Battery remaining energy in nanowatt-hours, as a long integer.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PROPERTY_ENERGY_COUNTER
  static const int BATTERY_PROPERTY_ENERGY_COUNTER = 5;

  /// Battery charge status, from a BATTERY_STATUS_* value.
  ///
  /// See: https://developer.android.com/reference/android/os/BatteryManager#BATTERY_PROPERTY_STATUS
  static const int BATTERY_PROPERTY_STATUS = 6;
}
