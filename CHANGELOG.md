Changelog
---------

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.4.0] - 2019-03-13
### Added
- `android_hardware.Sensor.*` constants
- `android_hardware.SensorManager.*` constants
- `android_location.Location.*` constants
- `android_os.*.*` constants

## [0.3.7] - 2019-03-12
### Added
- `android_bluetooth.Bluetooth{Adapter,Device,Headset,LeScanner}.*` constants

## [0.3.6] - 2019-02-28
No functional changes.

## [0.3.5] - 2019-02-15
### Changed
- Fixed a bug in `android_hardware.SensorManager.registerListener()`

## [0.3.4] - 2019-02-15
### Added
- `android_location.Location` class
- `android_hardware.Sensor#subscribe()` method
- `android_hardware.SensorEvent` class
- `android_hardware.SensorManager.getDefaultSensor()` static method
- `android_hardware.SensorManager.registerListener()` static method

## [0.3.3] - 2019-02-15
### Added
- `android_location.Location` class stub
- `android_location.Location.distanceBetween()` static method

## [0.3.2] - 2019-02-15
### Added
- Declared Bluetooth permissions for the example app
- Declared body sensor permissions for the example app
- `android_hardware.Sensor` class stub
- `android_hardware.SensorEvent` class stub
- `android_hardware.SensorEventListener` class stub
- `android_hardware.SensorManager` class stub

## [0.3.1] - 2019-02-14
### Added
- `android_bluetooth.BluetoothAdapter` class stub
- `android_bluetooth.BluetoothDevice` class stub
- `android_bluetooth.BluetoothHeadset` class stub
- `android_bluetooth.BluetoothLeScanner` class stub
- `android_bluetooth.BluetoothManager` class stub

## [0.3.0] - 2019-02-14
### Changed
- Required Dart SDK 2.1+
### Added
- Face detection demo in the example app
- `android_graphics.Bitmap.fromImage()` static method
- `android_graphics.Bitmap.fromAssetImage()` static method
- `android_graphics.Bitmap#getHeight()` method
- `android_graphics.Bitmap#getWidth()` method
- `android_graphics.Bitmap#toImage()` method
- `android_graphics.Point` class
- `android_graphics.PointF` class
- `android_media.Face` class
- `android_media.FaceDetector` class

## [0.2.5] - 2019-02-13
### Added
- `android_graphics` library
- `android_graphics.Bitmap` class

## [0.2.4] - 2019-01-28
### Changed
- Added sanity checks to `android_database.MatrixCursor`

## [0.2.3] - 2018-12-10
### Added
- `android_content.Context.getSharedPreferences()` method
- `android_content.SharedPreferences` class

## [0.2.2] - 2018-12-08
### Changed
- Made `android_database.Cursor` iterable

## [0.2.1] - 2018-12-06
### Changed
- Enhanced the example application and added a screenshot

## [0.2.0] - 2018-12-05
### Changed
- `android_database.Cursor#getBlob()` now returns a `Uint8List`, not a `ByteBuffer`

## [0.1.14] - 2018-12-04
### Added
- `android_content.ContentValues` class

## [0.1.13] - 2018-11-23
### Added
- `android_app.ActivityManager.isRunningInTestHarness` getter

## [0.1.12] - 2018-11-22
### Changed
- Corrected the return value for `android_database.Cursor#moveToNext()`

## [0.1.11] - 2018-11-21
### Added
- `android_database.MatrixCursor` class
### Changed
- Corrected return values for `android_database.Cursor#moveTo*()` methods

## [0.1.10] - 2018-11-21
### Added
- `android_database.DatabaseUtils` static methods

## [0.1.9] - 2018-11-21
### Added
- `android_app.Notification` class
- `android_app.NotificationAction` class

## [0.1.8] - 2018-11-20
### Added
- [meta](https://pub.dartlang.org/packages/meta) dependency

## [0.1.7] - 2018-11-15
### Added
- `android_database.Cursor#get()` method
### Changed
- `android_database.CursorIndexOutOfBoundsException` constructor

## [0.1.6] - 2018-11-15
### Added
- `android_database.Cursor` interface
- `android_database.CursorIndexOutOfBoundsException` exception
- `android_database.DatabaseUtils` class
- `android_database.SQLException` exception

## [0.1.5] - 2018-11-15
### Added
- `android_app.WallpaperColors` class
- `android_content.ComponentName` class
- `android_content.Intent` class
- `android_os.Bundle` class

## [0.1.4] - 2018-11-14
### Added
- `android_bluetooth` library
- `android_database` library
- `android_hardware` library
- `android_location` library
- `android_media` library
- `android_net` library
- `android_nfc` library
- `android_provider` library
- `android_security` library
- `android_speech` library
- `android_telephony` library
- `android_view` library

## [0.1.3] - 2018-11-14
### Added
- `android_content.Context.*_SERVICE` constants
- `android_content.Context.getSystemService()` method
### Changed
- All plugin code is now protected by a `LocalPlatform().isAndroid` assertion
- The appropriate classes now implement `android_os.Parcelable`

## [0.1.2] - 2018-11-14
### Added
- [platform](https://pub.dartlang.org/packages/platform) dependency
- `android_app` library

## [0.1.1] - 2018-11-03
### Added
- `android_os` library
- `android_os.Environment.dataDirectory` getter
- `android_os.Environment.downloadCacheDirectory` getter
- `android_os.Environment.externalStorageDirectory` getter
- `android_os.Environment.externalStorageState` getter
- `android_os.Environment.rootDirectory` getter
- `android_os.Environment.isExternalStorageEmulated` getter
- `android_os.Environment.isExternalStorageRemovable` getter

## [0.1.0] - 2018-11-03
### Added
- `android_content` library
- `android_content.Context.cacheDir` getter
- `android_content.Context.codeCacheDir` getter
- `android_content.Context.dataDir` getter
- `android_content.Context.externalCacheDir` getter
- `android_content.Context.externalFilesDir` getter
- `android_content.Context.filesDir` getter
- `android_content.Context.noBackupFilesDir` getter
- `android_content.Context.packageCodePath` getter
- `android_content.Context.packageName` getter
- `android_content.Context.packageResourcePath` getter

[0.4.0]:  https://github.com/drydart/flutter_android/compare/0.3.7...0.4.0
[0.3.7]:  https://github.com/drydart/flutter_android/compare/0.3.6...0.3.7
[0.3.6]:  https://github.com/drydart/flutter_android/compare/0.3.5...0.3.6
[0.3.5]:  https://github.com/drydart/flutter_android/compare/0.3.4...0.3.5
[0.3.4]:  https://github.com/drydart/flutter_android/compare/0.3.3...0.3.4
[0.3.3]:  https://github.com/drydart/flutter_android/compare/0.3.2...0.3.3
[0.3.2]:  https://github.com/drydart/flutter_android/compare/0.3.1...0.3.2
[0.3.1]:  https://github.com/drydart/flutter_android/compare/0.3.0...0.3.1
[0.3.0]:  https://github.com/drydart/flutter_android/compare/0.2.5...0.3.0
[0.2.5]:  https://github.com/drydart/flutter_android/compare/0.2.4...0.2.5
[0.2.4]:  https://github.com/drydart/flutter_android/compare/0.2.3...0.2.4
[0.2.3]:  https://github.com/drydart/flutter_android/compare/0.2.2...0.2.3
[0.2.2]:  https://github.com/drydart/flutter_android/compare/0.2.1...0.2.2
[0.2.1]:  https://github.com/drydart/flutter_android/compare/0.2.0...0.2.1
[0.2.0]:  https://github.com/drydart/flutter_android/compare/0.1.14...0.2.0
[0.1.14]: https://github.com/drydart/flutter_android/compare/0.1.13...0.1.14
[0.1.13]: https://github.com/drydart/flutter_android/compare/0.1.12...0.1.13
[0.1.12]: https://github.com/drydart/flutter_android/compare/0.1.11...0.1.12
[0.1.11]: https://github.com/drydart/flutter_android/compare/0.1.10...0.1.11
[0.1.10]: https://github.com/drydart/flutter_android/compare/0.1.9...0.1.10
[0.1.9]:  https://github.com/drydart/flutter_android/compare/0.1.8...0.1.9
[0.1.8]:  https://github.com/drydart/flutter_android/compare/0.1.7...0.1.8
[0.1.7]:  https://github.com/drydart/flutter_android/compare/0.1.6...0.1.7
[0.1.6]:  https://github.com/drydart/flutter_android/compare/0.1.5...0.1.6
[0.1.5]:  https://github.com/drydart/flutter_android/compare/0.1.4...0.1.5
[0.1.4]:  https://github.com/drydart/flutter_android/compare/0.1.3...0.1.4
[0.1.3]:  https://github.com/drydart/flutter_android/compare/0.1.2...0.1.3
[0.1.2]:  https://github.com/drydart/flutter_android/compare/0.1.1...0.1.2
[0.1.1]:  https://github.com/drydart/flutter_android/compare/0.1.0...0.1.1
[0.1.0]:  https://github.com/drydart/flutter_android/compare/0.0.1...0.1.0
