/* This is free and unencumbered software released into the public domain. */

/// Information about the current build, extracted from system properties.
///
/// See: https://developer.android.com/reference/android/os/Build.html
abstract class Build {

  /// Returns the version string for the radio firmware.
  ///
  /// May return `null` (if, for instance, the radio is not currently on).
  ///
  /// See: https://developer.android.com/reference/android/os/Build.html#getRadioVersion()
  static Future<String> get radioVersion {
    return null; // TODO
  }

  /// Gets the hardware serial number, if available.
  ///
  /// See: https://developer.android.com/reference/android/os/Build.html#getSerial()
  static Future<String> get serial {
    return null; // TODO
  }
}
