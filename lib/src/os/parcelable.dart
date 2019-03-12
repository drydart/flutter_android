/* This is free and unencumbered software released into the public domain. */

/// Interface for classes whose instances can be written to and restored from a
/// [Parcel].
///
/// See: https://developer.android.com/reference/android/os/Parcelable
/*mixin*/ abstract class Parcelable {

  /// Flag for use with `writeToParcel`.
  ///
  /// See: https://developer.android.com/reference/android/os/Parcelable#PARCELABLE_WRITE_RETURN_VALUE
  static const int PARCELABLE_WRITE_RETURN_VALUE = 1;

  /// Descriptor bit used with `describeContents()`: indicates that the Parcelable object's flattened representation includes a file descriptor.
  ///
  /// See: https://developer.android.com/reference/android/os/Parcelable#CONTENTS_FILE_DESCRIPTOR
  static const int CONTENTS_FILE_DESCRIPTOR = 1;
}
