/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' show launch;

////////////////////////////////////////////////////////////////////////////////

final Map<String, String> libraries = <String, String>{
  'android_app': "",
  'android_bluetooth': "",
  'android_content': "",
  'android_database': "",
  'android_graphics': "",
  'android_hardware': "",
  'android_location': "",
  'android_media': "",
  'android_net': "",
  'android_nfc': "",
  'android_os': "",
  'android_provider': "",
  'android_security': "",
  'android_speech': "",
  'android_telephony': "",
  'android_view': "",
};

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
    final libraryKeys = libraries.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: libraryKeys.length, // TODO
      itemBuilder: (final BuildContext context, final int index) {
        final String libraryKey = libraryKeys[index];
        return GestureDetector(
          onTap: () => launch(_getURL(libraryKey)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(_getTitle(libraryKey)),
            subtitle: Text(libraries[libraryKey]),
            //trailing: Icon(Icons.info, color: Theme.of(context).disabledColor),
          ),
        );
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  String _getTitle(final String qualifiedLibraryName) {
    return qualifiedLibraryName;
  }

  String _getURL(final String qualifiedLibraryName) {
    final libraryName = qualifiedLibraryName;
    return "https://pub.dartlang.org/documentation/flutter_android/latest/$libraryName/$libraryName-library.html";
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
