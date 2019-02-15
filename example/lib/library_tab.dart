/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launch;

import 'src/metadata.dart' show metadata;

////////////////////////////////////////////////////////////////////////////////

class LibraryTab extends StatefulWidget {
  @override
  State<LibraryTab> createState() => _LibraryTabState();
}

////////////////////////////////////////////////////////////////////////////////

class _LibraryTabState extends State<LibraryTab> {
  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    final libraryNames = metadata.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: libraryNames.length,
      itemBuilder: (final BuildContext context, final int index) {
        final String libraryName = libraryNames[index];
        return GestureDetector(
          onTap: () => launch(_getURL(libraryName)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(libraryName),
            subtitle: Text(""), // TODO
            //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
          ),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  String _getURL(final String libraryName) {
    return "https://pub.dartlang.org/documentation/flutter_android/latest/$libraryName/$libraryName-library.html";
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
