/* This is free and unencumbered software released into the public domain. */

/// A description of an [Intent] and target action to perform with it.
///
/// See: https://developer.android.com/reference/android/app/PendingIntent
abstract class PendingIntent {
  /// See: https://developer.android.com/reference/android/app/PendingIntent.html#FLAG_CANCEL_CURRENT
  static const int FLAG_CANCEL_CURRENT = 0x10000000;

  /// See: https://developer.android.com/reference/android/app/PendingIntent.html#FLAG_IMMUTABLE
  static const int FLAG_IMMUTABLE = 0x04000000;

  /// See: https://developer.android.com/reference/android/app/PendingIntent.html#FLAG_NO_CREATE
  static const int FLAG_NO_CREATE = 0x20000000;

  /// See: https://developer.android.com/reference/android/app/PendingIntent.html#FLAG_ONE_SHOT
  static const int FLAG_ONE_SHOT = 0x40000000;

  /// See: https://developer.android.com/reference/android/app/PendingIntent.html#FLAG_UPDATE_CURRENT
  static const int FLAG_UPDATE_CURRENT = 0x08000000;
}
