/* This is free and unencumbered software released into the public domain. */

import 'dart:typed_data'
    show
        ByteData,
        Endian,
        Float32List,
        Float64List,
        Int16List,
        Int32List,
        Int64List,
        Uint8List;

import 'package:typed_data/typed_buffers.dart' show Uint8Buffer;

import 'bundle.dart' show Bundle;
import 'parcelable.dart' show Parcelable;

const int VAL_NULL = -1;
const int VAL_STRING = 0;
const int VAL_INTEGER = 1;
const int VAL_MAP = 2;
const int VAL_BUNDLE = 3;
const int VAL_PARCELABLE = 4;
const int VAL_SHORT = 5;
const int VAL_LONG = 6;
const int VAL_FLOAT = 7;
const int VAL_DOUBLE = 8;
const int VAL_BOOLEAN = 9;
const int VAL_CHARSEQUENCE = 10;
const int VAL_LIST = 11;
const int VAL_SPARSEARRAY = 12;
const int VAL_BYTEARRAY = 13;
const int VAL_STRINGARRAY = 14;
const int VAL_IBINDER = 15;
const int VAL_PARCELABLEARRAY = 16;
const int VAL_OBJECTARRAY = 17;
const int VAL_INTARRAY = 18;
const int VAL_LONGARRAY = 19;
const int VAL_BYTE = 20;
const int VAL_SERIALIZABLE = 21;
const int VAL_SPARSEBOOLEANARRAY = 22;
const int VAL_BOOLEANARRAY = 23;
const int VAL_CHARSEQUENCEARRAY = 24;
const int VAL_PERSISTABLEBUNDLE = 25;
const int VAL_SIZE = 26;
const int VAL_SIZEF = 27;
const int VAL_DOUBLEARRAY = 28;

/// Container for a message (data and object references) that can be sent
/// through an `IBinder`.
///
/// See: https://developer.android.com/reference/android/os/Parcel
class Parcel {
  /// See: https://developer.android.com/reference/android/os/Parcel#STRING_CREATOR
  //static const Parcelable.Creator<String> STRING_CREATOR = null; // TODO

  final Uint8Buffer _output = Uint8Buffer();
  final ByteData _buffer = ByteData(8);
  Uint8List _bufferAsList;

  Parcel.obtain() {
    _bufferAsList = _buffer.buffer.asUint8List();
  }

  void writeValue(final Object val) {
    if (val == null) {
      writeInt(VAL_NULL);
    } else if (val is String) {
      writeInt(VAL_STRING);
      writeString(val);
    } else if (val is Map<String, Object>) {
      writeInt(VAL_MAP);
      writeMap(val);
    } else if (val is Bundle) {
      // Must come before Parcelable
      writeInt(VAL_BUNDLE);
      writeBundle(val);
    } else if (val is Parcelable) {
      // Classes that implement Parcelable must come before this
      writeInt(VAL_PARCELABLE);
      writeParcelable(val, 0);
    } else if (val is int) {
      writeInt(VAL_LONG);
      writeLong(val);
    } else if (val is double) {
      writeInt(VAL_DOUBLE);
      writeDouble(val);
    } else if (val is bool) {
      writeInt(VAL_BOOLEAN);
      writeBoolean(val);
    } else if (val is Float64List) {
      // Must come before List
      writeInt(VAL_DOUBLEARRAY);
      writeDoubleArray(val);
    } else if (val is Uint8List) {
      // Must come before List
      writeInt(VAL_BYTEARRAY);
      writeByteArray(val);
    } else if (val is Int32List) {
      // Must come before List
      writeInt(VAL_INTARRAY);
      writeIntArray(val);
    } else if (val is Int64List) {
      // Must come before List
      writeInt(VAL_LONGARRAY);
      writeLongArray(val);
    } else if (val is List<bool>) {
      // Must come before List
      writeInt(VAL_BOOLEANARRAY);
      writeBooleanArray(val);
    } else if (val is List<String>) {
      // Must come before List
      writeInt(VAL_STRINGARRAY);
      writeStringArray(val);
    } else if (val is List) {
      writeInt(VAL_LIST);
      writeList(val);
    } else {
      throw ArgumentError("Parcel: unable to marshal value $val");
    }
  }

  void writeBoolean(final bool val) {
    writeInt(val ? 1 : 0);
  }

  void writeFloat(final double val) {
    _buffer.setFloat32(0, val, Endian.host);
    _write(_bufferAsList, 0, 4);
  }

  void writeDouble(final double val) {
    _buffer.setFloat64(0, val, Endian.host);
    _write(_bufferAsList, 0, 8);
  }

  void writeByte(final int val) {
    writeInt(val);
  }

  void writeInt(final int val) {
    _buffer.setInt32(0, val, Endian.host);
    _write(_bufferAsList, 0, 4);
  }

  void writeLong(final int val) {
    _buffer.setInt64(0, val, Endian.host);
    _write(_bufferAsList, 0, 8);
  }

  void writeString(final String val) {
    if (val == null) {
      return writeInt(-1);
    }
    writeInt(val.length);
    _write(Int16List.fromList(val.codeUnits) // TODO: optimize this
        .buffer
        .asUint8List());
  }

  void writeBooleanArray(final List<bool> vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    vals.forEach((val) => writeBoolean(val));
  }

  void writeFloatArray(final Float32List vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    _write(vals.buffer.asUint8List(vals.offsetInBytes, 4 * vals.length));
  }

  void writeDoubleArray(final Float64List vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    _write(vals.buffer.asUint8List(vals.offsetInBytes, 8 * vals.length));
  }

  void writeByteArray(final Uint8List vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    _write(vals);
  }

  void writeCharArray(final Int16List vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    // Can't use buffer.putInt16List() because Android uses writeInt()
    vals.forEach((val) => writeInt(val));
  }

  void writeIntArray(final Int32List vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    _write(vals.buffer.asUint8List(vals.offsetInBytes, 4 * vals.length));
  }

  void writeLongArray(final Int64List vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    _write(vals.buffer.asUint8List(vals.offsetInBytes, 8 * vals.length));
  }

  void writeStringArray(final List<String> vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    vals.forEach((val) => writeString(val));
  }

  void writeList(final List<Object> vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    vals.forEach((val) => writeValue(val));
  }

  void writeMap(final Map<String, Object> vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    vals.forEach((key, val) {
      writeValue(key);
      writeValue(val);
    });
  }

  void writeArrayMap(final Map<String, Object> vals) {
    if (vals == null) {
      return writeInt(-1);
    }
    writeInt(vals.length);
    vals.forEach((key, val) {
      writeString(key);
      writeValue(val);
    });
  }

  void writeBundle(final Bundle bundle) {
    if (bundle == null) {
      return writeInt(-1);
    }
    bundle.writeToParcel(this);
  }

  void writeParcelable(final Parcelable parcelable, [int parcelableFlags = 0]) {
    if (parcelable == null) {
      return writeString(null);
    }
    writeString(parcelable.parcelableCreator);
    parcelable.writeToParcel(this, parcelableFlags);
  }

  void _write(final Uint8List data, [int start = 0, int end]) {
    _output.addAll(data, start, end);
    if (_output.lengthInBytes % 4 != 0) {
      _writePadding(4 - _output.lengthInBytes % 4);
    }
  }

  void _writePadding(final int count) {
    for (var i = 0; i < count; i++) {
      _output.add(0);
    }
  }

  ByteData asByteData() {
    return _output.buffer.asByteData(0, _output.lengthInBytes);
  }

  Uint8List asUint8List() {
    return Uint8List.sublistView(asByteData());
  }
}
