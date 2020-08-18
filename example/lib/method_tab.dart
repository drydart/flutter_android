/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:url_launcher/url_launcher.dart' show launch;

//import 'src/metadata.dart' show metadata;

////////////////////////////////////////////////////////////////////////////////

typedef MethodCallback = Future<dynamic> Function();

final Map<String, MethodCallback> methods = <String, MethodCallback>{
  // TODO
};

////////////////////////////////////////////////////////////////////////////////

class MethodTab extends StatefulWidget {
  @override
  State<MethodTab> createState() => _MethodTabState();
}

////////////////////////////////////////////////////////////////////////////////

class _MethodTabState extends State<MethodTab> {
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
      itemCount: methodKeys.length,
      itemBuilder: (final BuildContext context, final int index) {
        final methodKey = methodKeys[index];
        return GestureDetector(
          onTap: () => launch(_getURL(methodKey)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(_getTitle(methodKey)),
            subtitle: FutureBuilder<dynamic>(
              future: _results[methodKey],
              builder: (final BuildContext context,
                  final AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    return snapshot.hasError
                        ? Text(snapshot.error)
                        : Text(snapshot.data.toString());
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                  default:
                    return Text("Unknown");
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

  String _getTitle(final String qualifiedMethodName) {
    final methodInfo = qualifiedMethodName.split(".");
    return <String>[methodInfo[1], methodInfo[2]].join(".");
  }

  String _getURL(final String qualifiedMethodName) {
    final methodInfo = qualifiedMethodName.split(".");
    final libraryName = methodInfo[0];
    final className = methodInfo[1];
    final methodName = methodInfo[2];
    return "https://pub.dev/documentation/flutter_android/latest/$libraryName/$className/$methodName.html";
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    final results = <String, Future<dynamic>>{};

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      methods.forEach((k, v) {
        results[k] = Future.value(""); //v();
      });
    } on PlatformException {
      // TODO: improve error handling
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _results = results;
    });
  }
}
