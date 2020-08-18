/* This is free and unencumbered software released into the public domain. */

import 'package:flutter/material.dart';

import 'class_tab.dart';
import 'demo_tab.dart';
import 'library_tab.dart';
import 'method_tab.dart';
import 'property_tab.dart';

////////////////////////////////////////////////////////////////////////////////

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

////////////////////////////////////////////////////////////////////////////////

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _tabs;
  int _tabIndex = 0;

  _MainScreenState()
      : _tabs = [
          DemoTab(),
          PropertyTab(),
          MethodTab(),
          ClassTab(),
          LibraryTab(),
        ],
        super();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Android Bindings"),
      ),
      body: _tabs[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onTabTapped,
        currentIndex: _tabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.slideshow),
            title: Text("Demos"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text("Properties"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scatter_plot),
            title: Text("Methods"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Classes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_library),
            title: Text("Libraries"),
          ),
        ],
      ),
    );
  }

  void _onTabTapped(final int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}
