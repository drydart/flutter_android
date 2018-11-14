/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show PlatformException;

/// Thrown when a call to `Context.startActivity(Intent)` or one of its variants
/// fails because an `Activity` can not be found to execute the given [Intent].
///
/// See: https://developer.android.com/reference/android/content/ActivityNotFoundException
class ActivityNotFoundException extends PlatformException {}
