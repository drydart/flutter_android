/* This is free and unencumbered software released into the public domain. */

import '../os/parcelable.dart' show Parcelable;

/// An intent is an abstract description of an operation to be performed.
///
/// An [Intent] provides a facility for performing late runtime binding between
/// the code in different applications. Its most significant use is in the
/// launching of activities, where it can be thought of as the glue between
/// activities. It is basically a passive data structure holding an abstract
/// description of an action to be performed.
///
/// See: https://developer.android.com/reference/android/content/Intent
abstract class Intent implements Parcelable {
}
