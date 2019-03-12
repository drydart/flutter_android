/* This is free and unencumbered software released into the public domain. */

import '../os/parcelable.dart';

/// This class is used to store a set of values that the [ContentResolver] can
/// process.
///
/// See: https://developer.android.com/reference/android/content/ContentValues
class ContentValues implements Parcelable {
  final Map<String, dynamic> map = const <String, dynamic>{};

  /// Creates an empty set of values using the default initial size.
  ///
  /// See: https://developer.android.com/reference/android/content/ContentValues#ContentValues()
  const ContentValues();
}
