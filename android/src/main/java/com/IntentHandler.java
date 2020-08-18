/* This is free and unencumbered software released into the public domain. */

package com.github.drydart.flutter_android;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import androidx.annotation.NonNull;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel.Result;

/** IntentHandler */
class IntentHandler extends FlutterMethodCallHandler {
  static final String CHANNEL = "flutter_android/Intent";

  IntentHandler(final @NonNull FlutterPlugin.FlutterPluginBinding binding) {
    super(binding);
  }

  @Override
  public void onMethodCall(final MethodCall call, final Result result) {
    assert(call != null);
    assert(result != null);

    final Context context = this.binding.getApplicationContext();
    assert(context != null);

    assert(call.method != null);
    switch (call.method) {
      case "startActivity": {
        final String action = getOptionalArgument(call, "action");
        final String data = getOptionalArgument(call, "data");
        final List<String> categories = getOptionalArgument(call, "categories");
        final String type = getOptionalArgument(call, "type");
        final String component = getOptionalArgument(call, "component");
        final Map<String, Object> extras = getOptionalArgument(call, "extras");
        final Integer flags = getOptionalArgument(call, "flags");
        final String package = getOptionalArgument(call, "package");

        final Intent intent = new Intent();
        if (action != null && !action.isEmpty()) {
          intent.setAction(action);
        }
        if (data != null && type != null) {
          intent.setDataAndTypeAndNormalize(Uri.parse(data), type);
        }
        else if (data != null && type == null) {
          intent.setDataAndNormalize(Uri.parse(data));
        }
        else if (data == null && type != null) {
          intent.setTypeAndNormalize(type);
        }
        if (categories != null) {
          for (final String category : categories) {
            if (!category.isEmpty()) {
              intent.addCategory(category);
            }
          }
        }
        if (component != null && !component.isEmpty()) {
          intent.setComponent(ComponentName.unflattenFromString(component));
        }
        if (extras != null) {
          for (Map.Entry<String, Object> entry : extras.entrySet()) {
            if (entry.getValue() instanceof Serializable) {
              intent.putExtra(entry.getKey(), (Serializable)entry.getValue());
            }
          }
        }
        if (flags != null) {
          intent.addFlags(flags);
        }
        if (package != null && !package.isEmpty()) {
          intent.setPackage(package);
        }
        context.startActivity(intent);
        result.success(null);
        break;
      }
      default: {
        result.notImplemented();
      }
    }
  }
}
