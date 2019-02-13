/* This is free and unencumbered software released into the public domain. */

import 'package:platform/platform.dart' show Platform, LocalPlatform;

const Platform _platform = LocalPlatform();

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
    assert(_platform.isAndroid);
    return null; // TODO
  }

  /// Gets the hardware serial number, if available.
  ///
  /// See: https://developer.android.com/reference/android/os/Build.html#getSerial()
  static Future<String> get serial {
    assert(_platform.isAndroid);
    return null; // TODO
  }
}
