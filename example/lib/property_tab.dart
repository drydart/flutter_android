/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:url_launcher/url_launcher.dart' show launch;

import 'src/metadata.dart' show metadata;

////////////////////////////////////////////////////////////////////////////////

class PropertyItem {
  final String libraryName;
  final String className;
  final String propertyName;
  final Future<dynamic> propertyValue;

  const PropertyItem(
      this.libraryName, this.className, this.propertyName, this.propertyValue);
}

////////////////////////////////////////////////////////////////////////////////

class PropertyTab extends StatefulWidget {
  @override
  State<PropertyTab> createState() => _PropertyTabState();
}

////////////////////////////////////////////////////////////////////////////////

class _PropertyTabState extends State<PropertyTab> {
  Map<String, PropertyItem> _properties = <String, PropertyItem>{};

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    final propertyKeys = _properties.keys.toList();
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: propertyKeys.length,
      itemBuilder: (final BuildContext context, final int index) {
        final propertyKey = propertyKeys[index];
        final property = _properties[propertyKey];
        return GestureDetector(
          onTap: () => launch(_getURL(property)),
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text(_getTitle(property)),
            subtitle: FutureBuilder<dynamic>(
              future: _properties[propertyKey].propertyValue,
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
                    return Text("Unknown",
                        style: TextStyle(fontStyle: FontStyle.italic));
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

  String _getTitle(final PropertyItem property) {
    return <String>[property.className, property.propertyName].join(".");
  }

  String _getURL(final PropertyItem property) {
    final libraryName = property.libraryName,
        className = property.className,
        propertyName = property.propertyName;
    return "https://pub.dev/documentation/flutter_android/latest/$libraryName/$className/$propertyName.html";
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    final properties = <String, PropertyItem>{};

    // Platform messages may fail, so we use a try/catch PlatformException.
    metadata.forEach((libraryName, classInfos) {
      for (final classInfo in classInfos) {
        final className = classInfo.name;
        classInfo.properties.forEach((propertyName, propertyCallback) {
          try {
            final propertyKey = "$libraryName.$className.$propertyName";
            properties[propertyKey] = PropertyItem(
                libraryName, className, propertyName, propertyCallback());
          } on PlatformException catch (e) {
            // TODO: improve error handling
            print(e);
          }
        });
      }
    });

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _properties = properties;
    });
  }
}
