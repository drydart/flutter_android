/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import java.io.InputStream;
import java.io.IOException;

/** FlutterMethodCallHandler */
@SuppressWarnings("unchecked")
abstract class FlutterMethodCallHandler implements MethodCallHandler {
  final protected FlutterPlugin.FlutterPluginBinding binding;

  FlutterMethodCallHandler(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
    this.binding = binding;
  }

  AssetManager
  getAssets() {
    return this.binding.getApplicationContext().getAssets();
  }

  AssetFileDescriptor
  openAsset(final @NonNull String assetName) throws IOException {
    final String assetKey = this.binding.getFlutterAssets().getAssetFilePathByName(assetName);
    return getAssets().openFd(assetKey);
  }

  Bitmap
  loadBitmap(final String assetName) throws IOException {
    return loadBitmap(assetName, null);
  }

  Bitmap
  loadBitmap(final String assetName,
             final BitmapFactory.Options options) throws IOException {
    final InputStream stream = openAsset(assetName).createInputStream();
    return BitmapFactory.decodeStream(stream, null, options);
  }

  static <T> T
  getRequiredArgument(final MethodCall call,
                      final String name) {
    assert(call != null);
    assert(name != null);

    if (!call.hasArgument(name)) {
      throw new AssertionError();
    }
    final T arg = call.argument(name);
    if (arg == null) {
      throw new AssertionError();
    }
    return arg;
  }

  static <T> T
  getOptionalArgument(final MethodCall call,
                      final String name) {
    return getOptionalArgument(call, name, (T)null);
  }

  static <T> T
  getOptionalArgument(final MethodCall call,
                      final String name,
                      final T defaultValue) {
    assert(call != null);
    assert(name != null);

    return call.hasArgument(name) && call.argument(name) != null ?
        (T)call.argument(name) : defaultValue;
  }
}
