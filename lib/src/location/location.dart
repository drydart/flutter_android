/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/services.dart' show MethodChannel;

/// A data class representing a geographic location.
///
/// A location can consist of a latitude, longitude, timestamp, and other
/// information such as bearing, altitude and velocity.
///
/// See: https://developer.android.com/reference/android/location/Location
abstract class Location {
  static const MethodChannel _channel =
      MethodChannel('flutter_android/Location');

  /// Computes the approximate distance in meters between two locations.
  ///
  /// See: https://developer.android.com/reference/android/location/Location.html#distanceBetween(double,%20double,%20double,%20double,%20float[])
  static Future<double> distanceBetween(double startLatitude,
      double startLongitude, double endLatitude, double endLongitude) async {

    final Map<String, dynamic> request = <String, dynamic>{
      'startLatitude': startLatitude,
      'startLongitude': startLongitude,
      'endLatitude': endLatitude,
      'endLongitude': endLongitude,
    };
    return await _channel.invokeMethod('distanceBetween', request);
  }
}
