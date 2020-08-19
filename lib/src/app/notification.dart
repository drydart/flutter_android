/* This is free and unencumbered software released into the public domain. */

import 'dart:ui' show Color;

import 'package:flutter/widgets.dart' show Icon;

import '../os/bundle.dart' show Bundle;
import '../os/parcel.dart' show Parcel;
import '../os/parcelable.dart' show Parcelable;
import 'notification_action.dart' show NotificationAction;

/// Represents how a persistent notification is to be presented to the user
/// using the [NotificationManager].
///
/// The [NotificationBuilder] has been added to make it easier to construct
/// notifications.
///
/// See: https://developer.android.com/reference/android/app/Notification
/// See: https://github.com/aosp-mirror/platform_frameworks_base/blob/master/core/java/android/app/Notification.java
class Notification with Parcelable {
  /// See: https://developer.android.com/reference/android/app/Notification#BADGE_ICON_LARGE
  static const int BADGE_ICON_LARGE = 2;

  /// See: https://developer.android.com/reference/android/app/Notification#BADGE_ICON_NONE
  static const int BADGE_ICON_NONE = 0;

  /// See: https://developer.android.com/reference/android/app/Notification#BADGE_ICON_SMALL
  static const int BADGE_ICON_SMALL = 1;

  /// See: https://developer.android.com/reference/android/app/Notification#VISIBILITY_PRIVATE
  static const int VISIBILITY_PRIVATE = 0;

  /// See: https://developer.android.com/reference/android/app/Notification#VISIBILITY_PUBLIC
  static const int VISIBILITY_PUBLIC = 1;

  /// See: https://developer.android.com/reference/android/app/Notification#VISIBILITY_SECRET
  static const int VISIBILITY_SECRET = -1;

  /// Array of all [NotificationAction] structures attached to this notification.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#actions
  final List<NotificationAction> actions;

  /// One of the predefined notification categories.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#category
  final String category;

  /// Accent color (an ARGB integer) to be applied.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#color
  final Color color;

  /// Additional semantic data to be carried around.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#extras
  final Bundle extras;

  /// Any additional flags.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#flags
  final int flags;

  /// If the icon in the status bar is to have more than one level, you can set
  /// this.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#iconLevel
  final int iconLevel;

  /// The number of events that this notification represents.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#number
  final int number;

  /// Replacement version of this notification whose content will be shown in an
  /// insecure context such as atop a secure keyguard.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#publicVersion
  final Notification publicVersion;

  /// The sphere of visibility of this notification.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#visibility
  final int visibility;

  /// A timestamp related to this notification, in milliseconds since the epoch.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#when
  final int when;

  /// Constructs a [Notification] object.
  Notification({
    this.actions,
    this.category,
    this.color,
    this.extras,
    this.flags,
    this.iconLevel,
    this.number,
    this.publicVersion,
    this.visibility,
    this.when,
  });

  /// Returns what icon should be shown for this notification if it is being
  /// displayed in a [Launcher] that supports badging.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getBadgeIconType()
  int getBadgeIconType() => null; // TODO

  /// Returns the id of the channel this notification posts to.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getChannelId()
  String getChannelId() => null; // TODO

  /// Get the key used to group this notification into a cluster or stack with
  /// other notifications on devices which support such rendering.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getGroup()
  String getGroup() => null; // TODO

  /// Returns which type of notifications in a group are responsible for audibly
  /// alerting the user.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getGroupAlertBehavior()
  int getGroupAlertBehavior() => null; // TODO

  /// The large icon shown in this notification's content view.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getLargeIcon()
  Icon getLargeIcon() => null; // TODO

  /// Returns the settings text.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getSettingsText()
  String getSettingsText() => null; // TODO

  /// Returns the id that this notification supersedes, if any.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getShortcutId()
  String getShortcutId() => null; // TODO

  /// The small icon representing this notification in the status bar and
  /// content view.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getSmallIcon()
  Icon getSmallIcon() => null; // TODO

  /// Get a sort key that orders this notification among other notifications
  /// from the same package.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getSortKey()
  String getSortKey() => null; // TODO

  /// Returns the duration from posting after which this notification should be
  /// canceled by the system, if it's not canceled already.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification#getTimeoutAfter()
  int getTimeoutAfter() => null; // TODO

  @override
  String get parcelableCreator => "android.app.Notification";

  @override
  void writeToParcel(final Parcel parcel, [final int flags = 0]) {
    throw UnimplementedError(); // TODO: https://github.com/aosp-mirror/platform_frameworks_base/blob/master/core/java/android/app/Notification.java#L1818
  }
}
