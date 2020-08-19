/* This is free and unencumbered software released into the public domain. */

import 'dart:math' as math;

import '../os/parcel.dart' show Parcel;
import '../os/parcelable.dart' show Parcelable;

/// [Point] holds two integer coordinates.
///
/// See: https://developer.android.com/reference/android/graphics/Point
class Point extends math.Point<int> with Parcelable {
  Point([final int x = 0, final int y = 0]) : super(x, y);

  @override
  String get parcelableCreator => "android.graphics.Point";

  @override
  void writeToParcel(final Parcel parcel, [final int flags = 0]) {
    throw UnimplementedError(); // TODO
  }
}
