/* This is free and unencumbered software released into the public domain. */

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_android/android_database.dart';

void main() {
  //Cursor cursor;

  setUp(() {
    //cursor = ...; // TODO
  });

  tearDown(() {
    //cursor = null;
  });

  group("android_database.DatabaseUtils", () {
    test("DatabaseUtils.dumpCurrentRowToString", () {
      // TODO
    });
    test("DatabaseUtils.dumpCurrentRowToStringBuffer", () {
      // TODO
    });
    test("DatabaseUtils.dumpCursorToString", () {
      // TODO
    });
  });

  group("android_database.MatrixCursor", () {
    test("MatrixCursor.empty", () {
      final Cursor cursor = MatrixCursor.empty();
      expect(cursor, isEmpty);
      expect(cursor.position, equals(-1));
      expect(cursor.isBeforeFirst, isTrue);
      for (var row in cursor) {} // ignore: unused_local_variable
      expect(cursor.position, equals(0));
      expect(cursor.isAfterLast, isTrue);
    });
    test("MatrixCursor.from", () {
      final Cursor cursor = MatrixCursor.from(
        columns: <String>['a', 'b', 'c'],
        rows: <List<dynamic>>[[1, 2, 3], [4, 5, 6], [7, 8, 9]],
      );
      expect(cursor, isNotEmpty);
      expect(cursor.position, equals(-1));
      expect(cursor.isBeforeFirst, isTrue);
      for (var row in cursor) {
        expect(row, hasLength(3));
        expect(row.keys, contains('a'));
        expect(row.keys, contains('b'));
        expect(row.keys, contains('c'));
      }
      expect(cursor.position, equals(3));
      expect(cursor.isAfterLast, isTrue);
    });
  });
}
