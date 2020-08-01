/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launch;

import 'src/metadata.dart' show metadata;

////////////////////////////////////////////////////////////////////////////////

class ClassTab extends StatefulWidget {
  @override
  State<ClassTab> createState() => _ClassTabState();
}

////////////////////////////////////////////////////////////////////////////////

class _ClassTabState extends State<ClassTab> {
  final List<MapEntry<String, String>> _classes = [];

  @override
  void initState() {
    super.initState();
    metadata.forEach((libraryName, classInfos) {
      for (final classInfo in classInfos) {
        _classes.add(MapEntry(libraryName, classInfo.name));
      }
    });
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: _classes.length,
      itemBuilder: (final BuildContext context, final int index) {
        final classEntry = _classes[index];
        return GestureDetector(
          onTap: () => launch(_getURL(classEntry.key, classEntry.value)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(classEntry.value),
            subtitle: Text("${classEntry.key}.${classEntry.value}"),
            //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
          ),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  String _getURL(final String libraryName, final String className) {
    return "https://pub.dev/documentation/flutter_android/latest/$libraryName/$className-class.html";
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
