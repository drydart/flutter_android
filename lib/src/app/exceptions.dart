/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show PlatformException;

import '../os/parcelable.dart' show Parcelable;

/// Thrown when authentication is needed from the end user before viewing the
/// content.
///
/// This exception is only appropriate where there is a concrete action the user
/// can take to authorize and make forward progress, such as confirming or
/// entering authentication credentials, or granting access via other means.
///
/// See: https://developer.android.com/reference/android/app/AuthenticationRequiredException
class AuthenticationRequiredException extends PlatformException implements Parcelable {}
