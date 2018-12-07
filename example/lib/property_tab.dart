/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_android/android.dart' show Android;
import 'package:flutter_android/android_content.dart' as android_content;
import 'package:url_launcher/url_launcher.dart';

////////////////////////////////////////////////////////////////////////////////

typedef Future<dynamic> PropertyCallback();

final Map<String, PropertyCallback> properties = <String, PropertyCallback>{
  'android.Android.platformVersion': () => Android.platformVersion,
  'android_content.Context.cacheDir': () => android_content.Context.cacheDir,
  'android_content.Context.codeCacheDir': () => android_content.Context.codeCacheDir,
  'android_content.Context.dataDir': () => android_content.Context.dataDir,
  'android_content.Context.externalCacheDir': () => android_content.Context.externalCacheDir,
  'android_content.Context.externalFilesDir': () => android_content.Context.externalFilesDir,
  'android_content.Context.filesDir': () => android_content.Context.filesDir,
  'android_content.Context.noBackupFilesDir': () => android_content.Context.noBackupFilesDir,
  'android_content.Context.packageCodePath': () => android_content.Context.packageCodePath,
  'android_content.Context.packageName': () => android_content.Context.packageName,
  'android_content.Context.packageResourcePath': () => android_content.Context.packageResourcePath,
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
    final propertyKeys = properties.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: propertyKeys.length,
      itemBuilder: (final BuildContext context, final int index) {
        final String propertyKey = propertyKeys[index];
        return GestureDetector(
          onTap: () => launch(_getURL(propertyKey)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(_getTitle(propertyKey)),
            subtitle: FutureBuilder<dynamic>(
              future: _results[propertyKey],
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
          ),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  String _getTitle(final String qualifiedPropertyName) {
    final propertyInfo = qualifiedPropertyName.split(".");
    return <String>[propertyInfo[1], propertyInfo[2]].join(".");
  }

  String _getURL(final String qualifiedPropertyName) {
    final propertyInfo = qualifiedPropertyName.split(".");
    final libraryName = propertyInfo[0];
    final className = propertyInfo[1];
    final propertyName = propertyInfo[2];
    return "https://pub.dartlang.org/documentation/flutter_android/latest/$libraryName/$className/$propertyName.html";
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    Map<String, Future<dynamic>> results = <String, Future<dynamic>>{};

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      properties.forEach((k, v) {
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
