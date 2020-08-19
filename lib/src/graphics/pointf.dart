/* This is free and unencumbered software released into the public domain. */

import 'dart:math' as math;

import '../os/parcel.dart' show Parcel;
import '../os/parcelable.dart' show Parcelable;

/// [PointF] holds two float coordinates.
///
/// See: https://developer.android.com/reference/android/graphics/PointF
class PointF extends math.Point<double> with Parcelable {
  PointF([final double x = 0, final double y = 0]) : super(x, y);

  @override
  String get parcelableCreator => "android.graphics.PointF";

  @override
  void writeToParcel(final Parcel parcel, [final int flags = 0]) {
    throw UnimplementedError(); // TODO
  }
}
