/* This is free and unencumbered software released into the public domain. */

import 'dart:async' show Future;

import 'package:meta/meta.dart' show experimental, required;

import 'cursor.dart' show Cursor;
import 'exceptions.dart' show CursorIndexOutOfBoundsException;

/// A mutable cursor implementation backed by an array of objects. Use
/// [addRow()] to add rows. Automatically expands internal capacity as needed.
///
/// See: https://developer.android.com/reference/android/database/MatrixCursor
class MatrixCursor extends Cursor {
  bool _isClosed = false;
  List<String> _columns = const <String>[];
  List<List<dynamic>> _rows = <List<dynamic>>[];
  int _rowIndex = -1;

  /// Constructs an empty cursor.
  MatrixCursor.empty();

  /// Constructs a cursor from the provided column/row data.
  @experimental
  MatrixCursor.from({@required List<String> columns, @required List<List<dynamic>> rows})
    : assert(columns != null),
      assert(rows != null),
      _columns = List.unmodifiable(columns),
      _rows = rows;

  @override
  Future<void> close() {
    _isClosed = true;
    _columns = null;
    _rows = null;
    _rowIndex = -1;
    return Future.value();
  }

  @override
  dynamic get(final int columnIndex) {
    if (_rowIndex < 0 || _rowIndex >= _rows.length) {
      throw CursorIndexOutOfBoundsException(_rowIndex, _rows.length);
    }
    if (columnIndex < 0 || columnIndex >= _columns.length) {
      throw CursorIndexOutOfBoundsException(columnIndex, _columns.length);
    }
    return _rows[_rowIndex][columnIndex];
  }

  @override
  List<String> getColumnNames() => _columns;

  @override
  int getCount() => _rows.length;

  @override
  int getPosition() => _rowIndex;

  @override
  bool get isClosed => _isClosed;

  @override
  bool moveToPosition(final int position) {
    if (position >= -1 && position <= _rows.length) {
      _rowIndex = position;
      return true; // request accepted
    }
    return false; // request rejected
  }

  /// Adds a new row to the end with the given column values.
  ///
  /// See: https://developer.android.com/reference/android/database/MatrixCursor#addRow(java.lang.Object[])
  void addRow(final List<dynamic> columnValues) {
    if (columnValues.length != _columns.length) {
      throw ArgumentError();
    }
    _rows.add(columnValues);
  }
}
