/* This is free and unencumbered software released into the public domain. */

import '../os/parcelable.dart';

/// Identifier for a specific application component that is available.
///
/// See: https://developer.android.com/reference/android/content/ComponentName
class ComponentName implements Parcelable {
  /// The package name of this component.
  ///
  /// See: https://developer.android.com/reference/android/content/ComponentName.html#getPackageName()
  final String packageName;

  /// The class name of this component.
  ///
  /// See: https://developer.android.com/reference/android/content/ComponentName.html#getClassName()
  final String className;

  /// Creates a new component identifier.
  ///
  /// See: https://developer.android.com/reference/android/content/ComponentName.html#ComponentName(java.lang.String,%20java.lang.String)
  ComponentName(this.packageName, this.className)
      : assert(packageName != null),
        assert(className != null);

  /// Return a string that unambiguously describes both the package and class
  /// names contained in the [ComponentName].
  ///
  /// See: https://developer.android.com/reference/android/content/ComponentName.html#flattenToString()
  String flattenToString() {
    return <String>[packageName, className].join("/");
  }
}
