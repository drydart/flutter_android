/* This is free and unencumbered software released into the public domain. */

import 'parcel.dart' show Parcel;
import 'parcelable.dart' show Parcelable;

/// A mapping from [String] keys to various [Parcelable] values.
///
/// See: https://developer.android.com/reference/android/os/Bundle
/// See: https://github.com/aosp-mirror/platform_frameworks_base/blob/master/core/java/android/os/Bundle.java
class Bundle with Parcelable {
  /// The canonical empty bundle.
  ///
  /// See: https://developer.android.com/reference/android/os/Bundle#EMPTY
  ///
  // ignore: non_constant_identifier_names
  static final Bundle EMPTY = Bundle();

  /// See: https://developer.android.com/reference/android/os/Bundle#CREATOR
  //static const Parcelable.Creator<Bundle> CREATOR = null; // TODO

  final Map<String, dynamic> mappings = Map.identity();

  /// Constructs a new, empty [Bundle].
  ///
  /// See: https://developer.android.com/reference/android/os/Bundle#Bundle()
  Bundle();

  /// Returns whether the mapping of this [Bundle] is empty.
  ///
  /// See: https://developer.android.com/reference/android/os/BaseBundle#isEmpty()
  bool get isEmpty => mappings.isEmpty;

  /// Reports whether the bundle contains any parcelled file descriptors.
  ///
  /// See: https://developer.android.com/reference/android/os/Bundle#hasFileDescriptors()
  bool get hasFileDescriptors => false;

  /// Returns the number of mappings contained in this [Bundle].
  ///
  /// See: https://developer.android.com/reference/android/os/BaseBundle#size()
  int get size => mappings.length;

  /// Removes all elements from the mapping of this [Bundle].
  ///
  /// See: https://developer.android.com/reference/android/os/Bundle#clear()
  void clear() => mappings.clear();

  /// Removes any entry with the given key from the mapping of this [Bundle].
  ///
  /// See: https://developer.android.com/reference/android/os/Bundle#remove(java.lang.String)
  void remove(final String key) => mappings.remove(key);

  /// Returns whether the given key is contained in the mapping of this [Bundle].
  ///
  /// See: https://developer.android.com/reference/android/os/BaseBundle#containsKey(java.lang.String)
  bool containsKey(final String key) => mappings.containsKey(key);

  /// Returns the entry with the given key as an object.
  ///
  /// See: https://developer.android.com/reference/android/os/BaseBundle#get(java.lang.String)
  dynamic get(final String key) => mappings[key];

  /// Returns the entry with the given key.
  ///
  /// See: https://developer.android.com/reference/android/os/BaseBundle#getString(java.lang.String)
  String getString(final String key) => get(key);

  /// Inserts a string value into the mapping of this [Bundle], replacing any
  /// existing value for the given key.
  ///
  /// See: https://developer.android.com/reference/android/os/BaseBundle#putString(java.lang.String,%20java.lang.String)
  void putString(final String key, final String value) => mappings[key] = value;

  @override
  String get parcelableCreator => "android.os.Bundle";

  @override
  void writeToParcel(final Parcel parcel, [final int flags = 0]) {
    throw UnimplementedError(); // TODO: https://github.com/aosp-mirror/platform_frameworks_base/blob/master/core/java/android/os/BaseBundle.java#L1556
  }
}
