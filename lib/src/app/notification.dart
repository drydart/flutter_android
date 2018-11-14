/* This is free and unencumbered software released into the public domain. */

import '../os/parcelable.dart' show Parcelable;

/// Represents how a persistent notification is to be presented to the user
/// using the [NotificationManager].
///
/// The [NotificationBuilder] has been added to make it easier to construct
/// notifications.
///
/// See: https://developer.android.com/reference/android/app/Notification
abstract class Notification implements Parcelable {
}
