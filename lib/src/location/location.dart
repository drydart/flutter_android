/* This is free and unencumbered software released into the public domain. */

import 'dart:io' show Platform;

import 'package:flutter/services.dart' show MethodChannel;

import '../os/bundle.dart' show Bundle;
import '../os/parcel.dart' show Parcel;
import '../os/parcelable.dart' show Parcelable;

/// A data class representing a geographic location.
///
/// A location can consist of a latitude, longitude, timestamp, and other
/// information such as bearing, altitude and velocity.
///
/// See: https://developer.android.com/reference/android/location/Location
/// See: https://github.com/aosp-mirror/platform_frameworks_base/blob/master/location/java/android/location/Location.java
class Location with Parcelable {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/Location');

  /// Constant used to specify formatting of a latitude or longitude in the form
  /// "[+-]DDD.DDDDD where D indicates degrees.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#FORMAT_DEGREES
  static const int FORMAT_DEGREES = 0;

  /// Constant used to specify formatting of a latitude or longitude in the form
  /// "[+-]DDD:MM.MMMMM" where D indicates degrees and M indicates minutes of
  /// arc (1 minute = 1/60th of a degree).
  ///
  /// See: https://developer.android.com/reference/android/location/Location#FORMAT_MINUTES
  static const int FORMAT_MINUTES = 1;

  /// Constant used to specify formatting of a latitude or longitude in the form
  /// "DDD:MM:SS.SSSSS" where D indicates degrees, M indicates minutes of arc,
  /// and S indicates seconds of arc (1 minute = 1/60th of a degree, 1 second =
  /// 1/3600th of a degree).
  ///
  /// See: https://developer.android.com/reference/android/location/Location#FORMAT_SECONDS
  static const int FORMAT_SECONDS = 2;

  /// See: https://developer.android.com/reference/android/location/Location#CREATOR
  //static const Parcelable.Creator<Location> CREATOR = null; // TODO

  /// The estimated horizontal accuracy of this location, radial, in meters.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getAccuracy()
  final double accuracy;

  /// The altitude if available, in meters above the WGS 84 reference ellipsoid
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getAltitude()
  final double altitude;

  /// The bearing, in degrees.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getBearing()
  final double bearing;

  /// The estimated bearing accuracy of this location, in degrees.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getBearingAccuracyDegrees()
  final double bearingAccuracyDegrees;

  /// The time of this fix, in elapsed real-time since system boot.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getElapsedRealtimeNanos()
  final int elapsedRealtimeNanos;

  /// Any additional provider-specific information about the location fix.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getExtras()
  final Bundle extras;

  /// The latitude, in degrees.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getLatitude()
  final double latitude;

  /// The longitude, in degrees.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getLongitude()
  final double longitude;

  /// The name of the provider that generated this fix.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getProvider()
  final String provider;

  /// The speed if it is available, in meters/second over ground.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getSpeed()
  final double speed;

  /// The estimated speed accuracy of this location, in meters per second.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getSpeedAccuracyMetersPerSecond()
  final double speedAccuracyMetersPerSecond;

  /// The UTC time of this fix, in milliseconds since January 1, 1970.
  ///
  /// https://developer.android.com/reference/android/location/Location#getTime()
  final int time;

  /// The estimated vertical accuracy of this location, in meters.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#getVerticalAccuracyMeters()
  final double verticalAccuracyMeters;

  Location(
    // FIXME: https://github.com/dart-lang/sdk/issues/40982
    this.latitude,
    this.longitude, {
    this.accuracy,
    this.altitude,
    this.bearing,
    this.bearingAccuracyDegrees,
    this.elapsedRealtimeNanos,
    this.extras,
    this.provider,
    this.speed,
    this.speedAccuracyMetersPerSecond,
    this.time,
    this.verticalAccuracyMeters,
  });

  /// Computes the approximate distance in meters between two locations.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#distanceBetween(double,%20double,%20double,%20double,%20float[])
  static Future<double> distanceBetween(double startLatitude,
      double startLongitude, double endLatitude, double endLongitude) async {
    assert(Platform.isAndroid);
    final request = <String, dynamic>{
      'startLatitude': startLatitude,
      'startLongitude': startLongitude,
      'endLatitude': endLatitude,
      'endLongitude': endLongitude,
    };
    return await _channel.invokeMethod('distanceBetween', request);
  }

  /// True if this location has a horizontal accuracy.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasAccuracy()
  bool get hasAccuracy => accuracy != null;

  /// True if this location has an altitude.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasAltitude()
  bool get hasAltitude => altitude != null;

  /// True if this location has a bearing.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasBearing()
  bool get hasBearing => bearing != null;

  /// True if this location has a bearing accuracy.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasBearingAccuracy()
  bool get hasBearingAccuracy => bearingAccuracyDegrees != null;

  /// True if this location has a speed.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasSpeed()
  bool get hasSpeed => speed != null;

  /// True if this location fix has a speed accuracy.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasSpeedAccuracy()
  bool get hasSpeedAccuracy => speedAccuracyMetersPerSecond != null;

  /// True if this location fix has a vertical accuracy.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#hasVerticalAccuracy()
  bool get hasVerticalAccuracy => verticalAccuracyMeters != null;

  /// True if this location fix came from a mock provider.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#isFromMockProvider()
  bool get isFromMockProvider => false;

  /// Returns the approximate distance in meters between this location and the
  /// given location.
  ///
  /// See: https://developer.android.com/reference/android/location/Location#distanceTo(android.location.Location)
  Future<double> distanceTo(final Location dest) {
    return distanceBetween(latitude, longitude, dest.latitude, dest.longitude);
  }

  @override
  String get parcelableCreator => "android.location.Location";

  @override
  void writeToParcel(final Parcel parcel, [final int flags = 0]) {
    throw UnimplementedError(); // TODO: https://github.com/aosp-mirror/platform_frameworks_base/blob/master/location/java/android/location/Location.java#L1177
  }
}
