/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;

import 'package:flutter/services.dart' show MethodChannel;

import '../os/bundle.dart' show Bundle;
import '../os/parcel.dart' show Parcel;
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
class Intent with Parcelable {
  static const MethodChannel _channel = MethodChannel('flutter_android/Intent');

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
  /// See: https://developer.android.com/reference/android/content/Intent#flags
  final int flags;

  /// Specifies the application package name this intent is limited to.
  final String package;

  Intent({
    this.action,
    this.data,
    this.categories,
    this.type,
    this.component,
    this.extras,
    this.flags,
    this.package,
  });

  /// Gives additional information about the action to execute.
  ///
  /// If this intent has multiple categories, returns the first of them.
  String get category => categories.isNotEmpty ? categories.first : null;

  /// Launches a new activity.
  ///
  /// See: https://developer.android.com/reference/android/content/Context#startActivity(android.content.Intent)
  Future<bool> startActivity() async {
    final request = <String, dynamic>{
      'action': action,
      'data': data?.toString(),
      'categories': categories,
      'type': type,
      'component': component?.flattenToString(),
      'extras': extras?.mappings,
      'flags': flags,
      'package': package,
    };
    return await _channel.invokeMethod('startActivity', request) as bool;
  }

  @override
  String get parcelableCreator => "android.content.Intent";

  @override
  void writeToParcel(final Parcel parcel, [final int flags = 0]) {
    throw UnimplementedError(); // TODO
  }
}
