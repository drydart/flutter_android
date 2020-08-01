/* This is free and unencumbered software released into the public domain. */

import 'package:flutter_android/android.dart' show Android;
import 'package:flutter_android/android_app.dart' as android_app;
import 'package:flutter_android/android_content.dart' as android_content;
import 'package:flutter_android/android_os.dart' as android_os;

////////////////////////////////////////////////////////////////////////////////

typedef PropertyCallback = Future<dynamic> Function();

////////////////////////////////////////////////////////////////////////////////

class MethodDescription {
  const MethodDescription();
}

////////////////////////////////////////////////////////////////////////////////

class ClassDescription {
  final String name;
  final Map<String, PropertyCallback> properties;
  final Map<String, MethodDescription> methods;

  const ClassDescription(this.name, {
    this.properties = const {},
    this.methods = const {},
  });
}

////////////////////////////////////////////////////////////////////////////////

final Map<String, List<ClassDescription>> metadata = <String, List<ClassDescription>>{
  'android': <ClassDescription>[
    ClassDescription('Android',
      properties: {
        'platformVersion': () => Android.platformVersion,
      },
    ),
  ],
  'android_app': <ClassDescription>[
    ClassDescription('Activity'),
    ClassDescription('ActivityManager',
      properties: {
        'isRunningInTestHarness': () => android_app.ActivityManager.isRunningInTestHarness,
      },
    ),
    ClassDescription('AlarmManager'),
    ClassDescription('DownloadManager',
      properties: {
        // FIXME: 'maxBytesOverMobile': () => android_app.DownloadManager.maxBytesOverMobile,
        // FIXME: 'recommendedMaxBytesOverMobile': () => android_app.DownloadManager.recommendedMaxBytesOverMobile,
      },
    ),
    ClassDescription('KeyguardManager'),
    ClassDescription('Notification'),
    ClassDescription('NotificationAction'),
    ClassDescription('NotificationBuilder'),
    ClassDescription('NotificationManager'),
    ClassDescription('PendingIntent'),
    ClassDescription('SearchManager'),
    ClassDescription('WallpaperColors'),
    ClassDescription('WallpaperInfo'),
    ClassDescription('WallpaperManager'),
  ],
  'android_bluetooth': <ClassDescription>[
    ClassDescription('BluetoothAdapter'),
    ClassDescription('BluetoothDevice'),
    ClassDescription('BluetoothHeadset'),
    ClassDescription('BluetoothLeScanner'),
    ClassDescription('BluetoothManager'),
  ],
  'android_content': <ClassDescription>[
    ClassDescription('ComponentName'),
    ClassDescription('ContentValues'),
    ClassDescription('Context',
      properties: {
        'cacheDir': () => android_content.Context.cacheDir,
        'codeCacheDir': () => android_content.Context.codeCacheDir,
        'dataDir': () => android_content.Context.dataDir,
        'externalCacheDir': () => android_content.Context.externalCacheDir,
        'externalFilesDir': () => android_content.Context.externalFilesDir,
        'filesDir': () => android_content.Context.filesDir,
        'noBackupFilesDir': () => android_content.Context.noBackupFilesDir,
        'packageCodePath': () => android_content.Context.packageCodePath,
        'packageName': () => android_content.Context.packageName,
        'packageResourcePath': () => android_content.Context.packageResourcePath,
      },
    ),
    ClassDescription('Intent'),
    ClassDescription('IntentFilter'),
    ClassDescription('SharedPreferences'),
  ],
  'android_database': <ClassDescription>[
    ClassDescription('Cursor'),
    ClassDescription('DatabaseUtils'),
    ClassDescription('MatrixCursor'),
  ],
  'android_graphics': <ClassDescription>[
    ClassDescription('Bitmap'),
    ClassDescription('Point'),
    ClassDescription('PointF'),
  ],
  'android_hardware': <ClassDescription>[
    ClassDescription('Sensor'),
    ClassDescription('SensorEvent'),
    ClassDescription('SensorEventListener'),
    ClassDescription('SensorManager'),
  ],
  'android_location': <ClassDescription>[
    ClassDescription('Location'),
  ],
  'android_media': <ClassDescription>[
    ClassDescription('Face'),
    ClassDescription('FaceDetector'),
  ],
  'android_net': <ClassDescription>[],
  'android_nfc': <ClassDescription>[],
  'android_os': <ClassDescription>[
    ClassDescription('BatteryManager'),
    ClassDescription('Build',
      properties: {
        'radioVersion': () => android_os.Build.radioVersion,
        'serial': () => android_os.Build.serial,
      },
    ),
    ClassDescription('Bundle'),
    ClassDescription('Environment',
      properties: {
        'dataDirectory': () => android_os.Environment.dataDirectory,
        'downloadCacheDirectory': () => android_os.Environment.downloadCacheDirectory,
        'externalStorageDirectory': () => android_os.Environment.externalStorageDirectory,
        'externalStorageState': () => android_os.Environment.externalStorageState,
        'rootDirectory': () => android_os.Environment.rootDirectory,
        'isExternalStorageEmulated': () => android_os.Environment.isExternalStorageEmulated,
        'isExternalStorageRemovable': () => android_os.Environment.isExternalStorageRemovable,
      },
    ),
    ClassDescription('HardwarePropertiesManager'),
    ClassDescription('Parcel'),
    ClassDescription('Parcelable'),
    ClassDescription('PowerManager'),
    ClassDescription('Process',
      properties: {
        'is64Bit': () => android_os.Process.is64Bit,
        'isIsolated': () => android_os.Process.isIsolated,
      },
    ),
    ClassDescription('StatFs'),
    ClassDescription('SystemClock'),
    ClassDescription('UserManager',
      properties: {
        'supportsMultipleUsers': () => android_os.UserManager.supportsMultipleUsers,
      },
    ),
    ClassDescription('VibrationEffect'),
    ClassDescription('Vibrator'),
  ],
  'android_provider': <ClassDescription>[],
  'android_security': <ClassDescription>[],
  'android_speech': <ClassDescription>[],
  'android_telephony': <ClassDescription>[],
  'android_view': <ClassDescription>[],
};
