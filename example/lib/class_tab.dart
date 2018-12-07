/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

////////////////////////////////////////////////////////////////////////////////

final Map<String, String> classes = <String, String>{
  'android.Android': "",
  'android_content.Context': "",
};

////////////////////////////////////////////////////////////////////////////////

class ClassTab extends StatefulWidget {
  @override
  State<ClassTab> createState() => _ClassState();
}

////////////////////////////////////////////////////////////////////////////////

class _ClassState extends State<ClassTab> {
  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    final classKeys = classes.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: classKeys.length, // TODO
      itemBuilder: (final BuildContext context, final int index) {
        final String classKey = classKeys[index];
        return GestureDetector(
          onTap: () => launch(_getURL(classKey)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(_getTitle(classKey)),
            subtitle: Text(classKey),
            //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
          ),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  String _getTitle(final String qualifiedClassName) {
    final classInfo = qualifiedClassName.split(".");
    return classInfo[1];
  }

  String _getURL(final String qualifiedClassName) {
    final classInfo = qualifiedClassName.split(".");
    final libraryName = classInfo[0];
    final className = classInfo[1];
    return "https://pub.dartlang.org/documentation/flutter_android/latest/$libraryName/$className-class.html";
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
