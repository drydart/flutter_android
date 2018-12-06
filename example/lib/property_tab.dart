/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_android/android.dart' as android;

////////////////////////////////////////////////////////////////////////////////

typedef Future<dynamic> PropertyCallback();

final Map<String, PropertyCallback> methods = <String, PropertyCallback>{
  'Android.platformVersion': () => android.Android.platformVersion,
  'Context.cacheDir': () => android.Context.cacheDir,
  'Context.codeCacheDir': () => android.Context.codeCacheDir,
  'Context.dataDir': () => android.Context.dataDir,
  'Context.externalCacheDir': () => android.Context.externalCacheDir,
  'Context.externalFilesDir': () => android.Context.externalFilesDir,
  'Context.filesDir': () => android.Context.filesDir,
  'Context.noBackupFilesDir': () => android.Context.noBackupFilesDir,
  'Context.packageCodePath': () => android.Context.packageCodePath,
  'Context.packageName': () => android.Context.packageName,
  'Context.packageResourcePath': () => android.Context.packageResourcePath,
};

////////////////////////////////////////////////////////////////////////////////

class PropertyTab extends StatefulWidget {
  @override
  State<PropertyTab> createState() => _PropertyState();
}

////////////////////////////////////////////////////////////////////////////////

class _PropertyState extends State<PropertyTab> {
  Map<String, Future<dynamic>> _results = <String, Future<dynamic>>{};

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    final methodKeys = methods.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: methods.length,
      itemBuilder: (final BuildContext context, final int index) {
        final String method = methodKeys[index];
        return ListTile(
          leading: Icon(Icons.info),
          title: Text(method),
          subtitle: FutureBuilder<dynamic>(
            future: _results[method],
            builder: (final BuildContext context, final AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Text("Unknown");
                case ConnectionState.done:
                  return snapshot.hasError ?
                    Text(snapshot.error) :
                    Text(snapshot.data.toString());
              }
            },
          ),
          //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    Map<String, Future<dynamic>> results = <String, Future<dynamic>>{};

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      methods.forEach((k, v) {
        results[k] = v();
      });
    }
    on PlatformException {
      // TODO: improve error handling
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() { _results = results; });
  }
}
