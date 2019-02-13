/* This is free and unencumbered software released into the public domain. */

import '../os/parcelable.dart' show Parcelable;

/// Structured description of [Intent] values to be matched.
///
/// An [IntentFilter] can match against actions, categories, and data (either
/// via its type, scheme, and/or path) in an Intent. It also includes a
/// "priority" value which is used to order multiple matching filters.
///
/// See: https://developer.android.com/reference/android/content/IntentFilter
abstract class IntentFilter implements Parcelable {}
