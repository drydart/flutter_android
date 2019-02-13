/* This is free and unencumbered software released into the public domain. */

import 'parcelable.dart' show Parcelable;

/// Describes a haptic effect to be performed by a [Vibrator].
///
/// These effects may be any number of things, from single shot vibrations to
/// complex waveforms.
///
/// See: https://developer.android.com/reference/android/os/VibrationEffect
abstract class VibrationEffect implements Parcelable {}
