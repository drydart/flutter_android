/* This is free and unencumbered software released into the public domain. */

import 'dart:math' as math;

import '../os/parcelable.dart' show Parcelable;

/// [PointF] holds two float coordinates.
///
/// See: https://developer.android.com/reference/android/graphics/PointF
class PointF extends math.Point<double> implements Parcelable {
  PointF([final double x = 0, final double y = 0]) : super(x, y);
}
