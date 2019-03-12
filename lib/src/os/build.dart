/* This is free and unencumbered software released into the public domain. */

import 'package:platform/platform.dart' show Platform, LocalPlatform;

const Platform _platform = LocalPlatform();

/// Information about the current build, extracted from system properties.
///
/// See: https://developer.android.com/reference/android/os/Build
abstract class Build {
  /// Value used for when a build property is unknown.
  ///
  /// See: https://developer.android.com/reference/android/os/Build#UNKNOWN
  static const String UNKNOWN = "unknown";

  /// Returns the version string for the radio firmware.
  ///
  /// May return `null` (if, for instance, the radio is not currently on).
  ///
  /// See: https://developer.android.com/reference/android/os/Build#getRadioVersion()
  static Future<String> get radioVersion {
    assert(_platform.isAndroid);
    return null; // TODO
  }

  /// Gets the hardware serial number, if available.
  ///
  /// See: https://developer.android.com/reference/android/os/Build#getSerial()
  static Future<String> get serial {
    assert(_platform.isAndroid);
    return null; // TODO
  }
}
