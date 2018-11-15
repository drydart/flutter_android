Changelog
---------

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.5] - 2018-11-15
### Added
- `android_app.WallpaperColors` class
- `android_content.ComponentName` class
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

[0.1.5]: https://github.com/drydart/flutter_android/compare/0.1.4...0.1.5
[0.1.4]: https://github.com/drydart/flutter_android/compare/0.1.3...0.1.4
[0.1.3]: https://github.com/drydart/flutter_android/compare/0.1.2...0.1.3
[0.1.2]: https://github.com/drydart/flutter_android/compare/0.1.1...0.1.2
[0.1.1]: https://github.com/drydart/flutter_android/compare/0.1.0...0.1.1
[0.1.0]: https://github.com/drydart/flutter_android/compare/0.0.1...0.1.0
