/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'demos/face_detector.dart' show FaceDetectorDemo;

////////////////////////////////////////////////////////////////////////////////

void main() => runApp(App());

////////////////////////////////////////////////////////////////////////////////

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

////////////////////////////////////////////////////////////////////////////////

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      color: Colors.grey,
      theme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: MainScreen(),
      routes: <String, WidgetBuilder>{
        '/face_detection': (context) => FaceDetectorDemo(),
      },
    );
  }
}
