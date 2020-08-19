/* This is free and unencumbered software released into the public domain. */

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_android/android_os.dart';

void main() {
  group('android_os', () {
    group('Parcel', () {
      test(".obtain()", () {
        expect(Parcel.obtain(), isNot(equals(null)));
      });
      test("#writeValue()", () {
        // TODO
      });
    });
    group('Parcelable', () {
      // TODO
    });
  });
}
