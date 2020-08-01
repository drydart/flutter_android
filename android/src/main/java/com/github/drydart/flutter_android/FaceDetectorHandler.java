/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.PointF;
import android.media.FaceDetector;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/** FaceDetectorHandler */
@SuppressWarnings("unchecked")
class FaceDetectorHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/FaceDetector";

  final BitmapFactory.Options options;

  FaceDetectorHandler(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
    super(binding);
    options = new BitmapFactory.Options();
    options.inPreferredConfig = Bitmap.Config.RGB_565;
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    assert(call.method != null);
    switch (call.method) {

      case "findFaces": {
        final int width = getRequiredArgument(call, "width");
        final int height = getRequiredArgument(call, "height");
        final int maxFaces = getRequiredArgument(call, "maxFaces");
        final String bitmapName = getRequiredArgument(call, "bitmapName");
        try {
          final Bitmap bitmap = loadBitmap(bitmapName, options);
          assert(bitmap != null);
          assert(bitmap.getWidth() == width);
          assert(bitmap.getHeight() == height);

          final FaceDetector.Face[] faces = findFaces(width, height, maxFaces, bitmap);

          final PointF midPoint = new PointF();
          final List<List<Double>> response = new ArrayList(faces.length);
          for (final FaceDetector.Face face : faces) {
            face.getMidPoint(midPoint);
            response.add(Arrays.asList(
              (double)face.confidence(),
              (double)midPoint.x,
              (double)midPoint.y,
              (double)face.eyesDistance(),
              (double)face.pose(FaceDetector.Face.EULER_X),
              (double)face.pose(FaceDetector.Face.EULER_Y),
              (double)face.pose(FaceDetector.Face.EULER_Z)
            ));
          }
          result.success(response);
        }
        catch (final IOException error) {
          result.error("IOException", error.getMessage(), error.toString());
        }
        break;
      }
      default: {
        result.notImplemented();
      }
    }
  }

  FaceDetector.Face[]
  findFaces(final int width,
            final int height,
            final int maxFaces,
            final Bitmap bitmap) {

    final FaceDetector.Face[] faces = new FaceDetector.Face[maxFaces];
    final FaceDetector detector = new FaceDetector(width, height, maxFaces);
    final int foundFaces = detector.findFaces(bitmap, faces);
    return Arrays.copyOf(faces, foundFaces);
  }
}
