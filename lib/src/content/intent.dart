/* This is free and unencumbered software released into the public domain. */

import '../os/bundle.dart' show Bundle;
import '../os/parcelable.dart' show Parcelable;
import 'component_name.dart';

/// An intent is an abstract description of an operation to be performed.
///
/// An [Intent] provides a facility for performing late runtime binding between
/// the code in different applications. Its most significant use is in the
/// launching of activities, where it can be thought of as the glue between
/// activities. It is basically a passive data structure holding an abstract
/// description of an action to be performed.
///
/// See: https://developer.android.com/reference/android/content/Intent
class Intent implements Parcelable {
  /// The general action to be performed.
  final String action;

  /// The data to operate on, such as a person record in the contacts database.
  final Uri data;

  /// Gives additional information about the action to execute.
  final List<String> categories;

  /// Specifies an explicit type (a MIME type) of the intent data.
  final String type;

  /// Specifies an explicit name of a component class to use for the intent.
  final ComponentName component;

  /// This is a [Bundle] of any additional information.
  final Bundle extras;

  /// Flags used on this [Intent].
  ///
  /// See: https://developer.android.com/reference/android/content/Intent.html#flags
  final int flags;

  Intent({
    this.action,
    this.data,
    this.categories,
    this.type,
    this.component,
    this.extras,
    this.flags,
  });

  /// Gives additional information about the action to execute.
  ///
  /// If this intent has multiple categories, returns the first of them.
  String get category => categories.isNotEmpty ? categories.first : null;
}
