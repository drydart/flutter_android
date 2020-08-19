/* This is free and unencumbered software released into the public domain. */

import 'parcel.dart' show Parcel;

/// Interface for classes whose instances can be written to and restored from a
/// [Parcel].
///
/// See: https://developer.android.com/reference/android/os/Parcelable
mixin Parcelable {
  /// Descriptor bit used with `describeContents()`: indicates that the
  /// `Parcelable` object's flattened representation includes a file
  /// descriptor.
  ///
  /// See: https://developer.android.com/reference/android/os/Parcelable#CONTENTS_FILE_DESCRIPTOR
  static const int CONTENTS_FILE_DESCRIPTOR = 1;

  /// Flag for use with `writeToParcel`.
  ///
  /// See: https://developer.android.com/reference/android/os/Parcelable#PARCELABLE_WRITE_RETURN_VALUE
  static const int PARCELABLE_WRITE_RETURN_VALUE = 1;

  String get parcelableCreator;

  /// Describe any special objects contained in this instance's marshaled representation.
  ///
  /// See: https://developer.android.com/reference/android/os/Parcelable#describeContents()
  int describeContents() {
    return 0;
  }

  /// Flatten this object in to a [Parcel].
  ///
  /// See: https://developer.android.com/reference/android/os/Parcelable#writeToParcel(android.os.Parcel,%20int)
  void writeToParcel(Parcel parcel, [int flags = 0]);
}
