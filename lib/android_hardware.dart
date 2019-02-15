/* This is free and unencumbered software released into the public domain. */

/// Provides support for hardware features, such as the camera and other
/// sensors.
///
/// See: https://developer.android.com/reference/android/hardware/package-summary
///
/// {@canonicalFor sensor.Sensor}
/// {@canonicalFor sensor_event.SensorEvent}
/// {@canonicalFor sensor_event_listener.SensorEventListener}
/// {@canonicalFor sensor_manager.SensorManager}
library android_hardware;

export 'src/hardware/sensor.dart' show Sensor;
export 'src/hardware/sensor_event.dart' show SensorEvent;
export 'src/hardware/sensor_event_listener.dart' show SensorEventListener;
export 'src/hardware/sensor_manager.dart' show SensorManager;
