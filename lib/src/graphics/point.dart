/* This is free and unencumbered software released into the public domain. */

import 'dart:math' as math;

import '../os/parcelable.dart' show Parcelable;

/// [Point] holds two integer coordinates.
///
/// See: https://developer.android.com/reference/android/graphics/Point
class Point extends math.Point<int> implements Parcelable {
  Point([final int x = 0, final int y = 0]) : super(x, y);
}
