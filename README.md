Flutter Android Bindings
========================

[![Project license](https://img.shields.io/badge/license-Public%20Domain-blue.svg)](https://unlicense.org)
[![Pub package](https://img.shields.io/pub/v/flutter_android.svg)](https://pub.dartlang.org/packages/flutter_android)
[![Dartdoc reference](https://img.shields.io/badge/dartdoc-reference-blue.svg)](https://pub.dartlang.org/documentation/flutter_android/latest/)
[![Travis CI build status](https://img.shields.io/travis/drydart/flutter_android/master.svg)](https://travis-ci.org/drydart/flutter_android)

This is a [Flutter](https://flutter.io) plugin for using Android's
numerous platform-specific APIs in Flutter apps.

Features
--------

- Implements bindings to a growing set of Android's platform-specific APIs.

- Reduces duplication of effort by centralizing Android bindings in a single package.

### Feature Table

| Feature | Flutter API |
| :--- | :--- |
| Bluetooth scanning | `android_bluetooth.BluetoothLeScanner` |
| Face detection | `android_media.FaceDetector` |
| Heart-rate monitoring | `android_hardware.SensorManager` |

Compatibility
-------------

Android only.

Examples
--------

### Face detection

```dart
import 'package:flutter_android/android_graphics.dart' show Bitmap;
import 'package:flutter_android/android_media.dart' show Face, FaceDetector;

var photo = Image.asset("images/einstein.png");

var bitmap = Bitmap.fromAssetImage(photo.image as AssetImage);
var detector = FaceDetector(width: 280, height: 396);

for (var face in await detector.findFaces(bitmap)) {
  if (face.confidence < Face.CONFIDENCE_THRESHOLD) {
    continue; // skip dubious results below the cut-off threshold
  }
  print("Found a face at (${face.midPoint.x}, ${face.midPoint.y}) with confidence ${face.confidence}");
}
```

Frequently Asked Questions
--------------------------

TODO

Caveats
-------

- **iOS is not and cannot be supported.**
  All `flutter_android` APIs throw an `AssertionError` if they are invoked
  when running on iOS. For cross-platform apps, we recommend that you depend
  on the [platform](https://pub.dartlang.org/packages/platform) package to
  conditionalize your use of Android APIs.

Reference
---------

### [`android`](https://pub.dartlang.org/documentation/flutter_android/latest/android/android-library.html)

    import 'package:flutter_android/android.dart' as android;

### [`android_app`](https://pub.dartlang.org/documentation/flutter_android/latest/android_app/android_app-library.html)

    import 'package:flutter_android/android_app.dart' as android_app;

- [`Notification`](https://pub.dartlang.org/documentation/flutter_android/latest/android_app/Notification-class.html)
- [`NotificationAction`](https://pub.dartlang.org/documentation/flutter_android/latest/android_app/NotificationAction-class.html)
- [`WallpaperColors`](https://pub.dartlang.org/documentation/flutter_android/latest/android_app/WallpaperColors-class.html)

### [`android_bluetooth`](https://pub.dartlang.org/documentation/flutter_android/latest/android_bluetooth/android_bluetooth-library.html)

    import 'package:flutter_android/android_bluetooth.dart' as android_bluetooth;

- [`BluetoothAdapter`](https://pub.dartlang.org/documentation/flutter_android/latest/android_bluetooth/BluetoothAdapter-class.html)
- [`BluetoothDevice`](https://pub.dartlang.org/documentation/flutter_android/latest/android_bluetooth/BluetoothDevice-class.html)
- [`BluetoothHeadset`](https://pub.dartlang.org/documentation/flutter_android/latest/android_bluetooth/BluetoothHeadset-class.html)
- [`BluetoothLeScanner`](https://pub.dartlang.org/documentation/flutter_android/latest/android_bluetooth/BluetoothLeScanner-class.html)
- [`BluetoothManager`](https://pub.dartlang.org/documentation/flutter_android/latest/android_bluetooth/BluetoothManager-class.html)

### [`android_content`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/android_content-library.html)

    import 'package:flutter_android/android_content.dart' as android_content;

- [`ComponentName`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/ComponentName-class.html)
- [`ContentValues`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/ContentValues-class.html)
- [`Context.cacheDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/cacheDir.html)
- [`Context.codeCacheDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/codeCacheDir.html)
- [`Context.dataDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/dataDir.html)
- [`Context.externalCacheDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/externalCacheDir.html)
- [`Context.externalFilesDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/externalFilesDir.html)
- [`Context.filesDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/filesDir.html)
- [`Context.getSharedPreferences()`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/getSharedPreferences.html)
- [`Context.getSystemService()`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/getSystemService.html)
- [`Context.noBackupFilesDir`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/noBackupFilesDir.html)
- [`Context.packageCodePath`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/packageCodePath.html)
- [`Context.packageName`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/packageName.html)
- [`Context.packageResourcePath`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Context/packageResourcePath.html)
- [`Intent`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/Intent-class.html)
- [`SharedPreferences`](https://pub.dartlang.org/documentation/flutter_android/latest/android_content/SharedPreferences-class.html)

### [`android_database`](https://pub.dartlang.org/documentation/flutter_android/latest/android_database/android_database-library.html)

    import 'package:flutter_android/android_database.dart' as android_database;

- [`Cursor`](https://pub.dartlang.org/documentation/flutter_android/latest/android_database/Cursor-class.html)
- [`DatabaseUtils`](https://pub.dartlang.org/documentation/flutter_android/latest/android_database/DatabaseUtils-class.html)
- [`MatrixCursor`](https://pub.dartlang.org/documentation/flutter_android/latest/android_database/MatrixCursor-class.html)

### [`android_graphics`](https://pub.dartlang.org/documentation/flutter_android/latest/android_graphics/android_graphics-library.html)

    import 'package:flutter_android/android_graphics.dart' as android_graphics;

- [`Bitmap`](https://pub.dartlang.org/documentation/flutter_android/latest/android_graphics/Bitmap-class.html)
- [`Point`](https://pub.dartlang.org/documentation/flutter_android/latest/android_graphics/Point-class.html)
- [`PointF`](https://pub.dartlang.org/documentation/flutter_android/latest/android_graphics/PointF-class.html)

### [`android_hardware`](https://pub.dartlang.org/documentation/flutter_android/latest/android_hardware/android_hardware-library.html)

    import 'package:flutter_android/android_hardware.dart' as android_hardware;

- [`Sensor`](https://pub.dartlang.org/documentation/flutter_android/latest/android_hardware/Sensor-class.html)
- [`SensorEvent`](https://pub.dartlang.org/documentation/flutter_android/latest/android_hardware/SensorEvent-class.html)
- [`SensorEventListener`](https://pub.dartlang.org/documentation/flutter_android/latest/android_hardware/SensorEventListener-class.html)
- [`SensorManager`](https://pub.dartlang.org/documentation/flutter_android/latest/android_hardware/SensorManager-class.html)

### [`android_media`](https://pub.dartlang.org/documentation/flutter_android/latest/android_media/android_media-library.html)

    import 'package:flutter_android/android_media.dart' as android_media;

- [`Face`](https://pub.dartlang.org/documentation/flutter_android/latest/android_media/Face-class.html)
- [`FaceDetector`](https://pub.dartlang.org/documentation/flutter_android/latest/android_media/FaceDetector-class.html)

### [`android_os`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/android_os-library.html)

    import 'package:flutter_android/android_os.dart' as android_os;

- [`Bundle`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Bundle-class.html)
- [`Environment.dataDirectory`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/dataDirectory.html)
- [`Environment.downloadCacheDirectory`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/downloadCacheDirectory.html)
- [`Environment.externalStorageDirectory`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/externalStorageDirectory.html)
- [`Environment.externalStorageState`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/externalStorageState.html)
- [`Environment.rootDirectory`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/rootDirectory.html)
- [`Environment.isExternalStorageEmulated`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/isExternalStorageEmulated.html)
- [`Environment.isExternalStorageRemovable`](https://pub.dartlang.org/documentation/flutter_android/latest/android_os/Environment/isExternalStorageRemovable.html)

Cross-Reference
---------------

| Android | Flutter |
| :--- | :--- |
| `android.app` | `android_app` |
| `android.app.Activity` | `android_app.Activity` |
| `android.app.ActivityManager` | `android_app.ActivityManager` |
| `android.app.AlarmManager` | `android_app.AlarmManager` |
| `android.app.AuthenticationRequiredException` | `android_app.AuthenticationRequiredException` |
| `android.app.DownloadManager` | `android_app.DownloadManager` |
| `android.app.KeyguardManager` | `android_app.KeyguardManager` |
| `android.app.Notification` | `android_app.Notification` |
| `android.app.Notification.Action` | `android_app.NotificationAction` |
| `android.app.Notification.Builder` | `android_app.NotificationBuilder` |
| `android.app.NotificationManager` | `android_app.NotificationManager` |
| `android.app.PendingIntent` | `android_app.PendingIntent` |
| `android.app.SearchManager` | `android_app.SearchManager` |
| `android.app.WallpaperColors` | `android_app.WallpaperColors` |
| `android.app.WallpaperInfo` | `android_app.WallpaperInfo` |
| `android.app.WallpaperManager` | `android_app.WallpaperManager` |
| `android.bluetooth` | `android_bluetooth` |
| `android.bluetooth.BluetoothAdapter` | `android_bluetooth.BluetoothAdapter` |
| `android.bluetooth.BluetoothDevice` | `android_bluetooth.BluetoothDevice` |
| `android.bluetooth.BluetoothHeadset` | `android_bluetooth.BluetoothHeadset` |
| `android.bluetooth.BluetoothManager` | `android_bluetooth.BluetoothManager` |
| `android.bluetooth.le.BluetoothLeScanner` | `android_bluetooth.BluetoothLeScanner` |
| `android.bluetooth.le` | `android_bluetooth` |
| `android.content` | `android_content` |
| `android.content.ActivityNotFoundException` | `android_content.ActivityNotFoundException` |
| `android.content.ComponentName` | `android_content.ComponentName` |
| `android.content.ContentValues` | `android_content.ContentValues` |
| `android.content.Context` | `android_content.Context` |
| `android.content.Intent` | `android_content.Intent` |
| `android.content.IntentFilter` | `android_content.IntentFilter` |
| `android.content.SharedPreferences` | `android_content.SharedPreferences` |
| `android.database` | `android_database` |
| `android.database.Cursor` | `android_database.Cursor` |
| `android.database.CursorIndexOutOfBoundsException` | `android_database.CursorIndexOutOfBoundsException` |
| `android.database.DatabaseUtils` | `android_database.DatabaseUtils` |
| `android.database.MatrixCursor` | `android_database.MatrixCursor` |
| `android.database.SQLException` | `android_database.SQLException` |
| `android.graphics` | `android_graphics` |
| `android.graphics.Bitmap` | `android_graphics.Bitmap` |
| `android.graphics.Color` | `dart-ui.Color` |
| `android.graphics.Point` | `android_graphics.Point` |
| `android.graphics.PointF` | `android_graphics.PointF` |
| `android.graphics.drawable.Icon` | `flutter.Icon` |
| `android.hardware` | `android_hardware` |
| `android.hardware.Sensor` | `android_hardware.Sensor` |
| `android.hardware.SensorEvent` | `android_hardware.SensorEvent` |
| `android.hardware.SensorEventListener` | `android_hardware.SensorEventListener` |
| `android.hardware.SensorManager` | `android_hardware.SensorManager` |
| `android.location` | `android_location` |
| `android.media` | `android_media` |
| `android.media.FaceDetector` | `android_media.FaceDetector` |
| `android.media.FaceDetector.Face` | `android_media.Face` |
| `android.net` | `android_net` |
| `android.nfc` | `android_nfc` |
| `android.os` | `android_os` |
| `android.os.BatteryManager` | `android_os.BatteryManager` |
| `android.os.Build` | `android_os.Build` |
| `android.os.Bundle` | `android_os.Bundle` |
| `android.os.Environment` | `android_os.Environment` |
| `android.os.HardwarePropertiesManager` | `android_os.HardwarePropertiesManager` |
| `android.os.Parcel` | `android_os.Parcel` |
| `android.os.Parcelable` | `android_os.Parcelable` |
| `android.os.PowerManager` | `android_os.PowerManager` |
| `android.os.Process` | `android_os.Process` |
| `android.os.StatFs` | `android_os.StatFs` |
| `android.os.SystemClock` | `android_os.SystemClock` |
| `android.os.UserManager` | `android_os.UserManager` |
| `android.os.VibrationEffect` | `android_os.VibrationEffect` |
| `android.os.Vibrator` | `android_os.Vibrator` |
| `android.provider` | `android_provider` |
| `android.security` | `android_security` |
| `android.speech` | `android_speech` |
| `android.telephony` | `android_telephony` |
| `android.view` | `android_view` |
| `java.util.Locale` | `dart-ui.Locale` |

See Also
--------

- The [flutter_sqlcipher](https://pub.dartlang.org/packages/flutter_sqlcipher) package
  that implements encrypted SQLite databases based on the `android.database` APIs.
