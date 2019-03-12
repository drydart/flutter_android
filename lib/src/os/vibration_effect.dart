/* This is free and unencumbered software released into the public domain. */

import 'parcelable.dart' show Parcelable;

/// Describes a haptic effect to be performed by a [Vibrator].
///
/// These effects may be any number of things, from single shot vibrations to
/// complex waveforms.
///
/// See: https://developer.android.com/reference/android/os/VibrationEffect
abstract class VibrationEffect implements Parcelable {

  /// The default vibration strength of the device.
  ///
  /// See: https://developer.android.com/reference/android/os/VibrationEffect#DEFAULT_AMPLITUDE
  static const int DEFAULT_AMPLITUDE = -1;

  /// See: https://developer.android.com/reference/android/os/VibrationEffect#CREATOR
  //static const Parcelable.Creator<VibrationEffect> CREATOR = null; // TODO
}
