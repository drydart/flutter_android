/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/widgets.dart' show Icon;

import 'pending_intent.dart' show PendingIntent;

/// Structure to encapsulate a named action that can be shown as part of a
/// notification.
///
/// It must include an icon, a label, and a [PendingIntent] to be fired when the
/// action is selected by the user.
///
/// See: https://developer.android.com/reference/android/app/Notification.Action
class NotificationAction {
  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_ARCHIVE
  static const int SEMANTIC_ACTION_ARCHIVE = 5;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_CALL
  static const int SEMANTIC_ACTION_CALL = 10;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_DELETE
  static const int SEMANTIC_ACTION_DELETE = 4;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_MARK_AS_READ
  static const int SEMANTIC_ACTION_MARK_AS_READ = 2;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_MARK_AS_UNREAD
  static const int SEMANTIC_ACTION_MARK_AS_UNREAD = 3;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_MUTE
  static const int SEMANTIC_ACTION_MUTE = 6;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_NONE
  static const int SEMANTIC_ACTION_NONE = 0;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_REPLY
  static const int SEMANTIC_ACTION_REPLY = 1;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_THUMBS_DOWN
  static const int SEMANTIC_ACTION_THUMBS_DOWN = 9;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_THUMBS_UP
  static const int SEMANTIC_ACTION_THUMBS_UP = 8;

  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#SEMANTIC_ACTION_UNMUTE
  static const int SEMANTIC_ACTION_UNMUTE = 7;

  /// Intent to send when the user invokes this action.
  ///
  /// May be null, in which case the action may be rendered in a disabled
  /// presentation by the system UI.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#actionIntent
  final PendingIntent intent;

  /// Small icon representing the action.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#icon
  final Icon icon;

  /// Title of the action.
  ///
  /// See: https://developer.android.com/reference/android/app/Notification.Action.html#title
  final String title;

  NotificationAction({
    this.intent,
    this.icon,
    this.title,
  });
}
