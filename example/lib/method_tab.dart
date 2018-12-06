/* This is free and unencumbered software released into the public domain. */

import 'dart:async';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////

class MethodTab extends StatefulWidget {
  @override
  State<MethodTab> createState() => _MethodState();
}

////////////////////////////////////////////////////////////////////////////////

class _MethodState extends State<MethodTab> {
  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: 0, // TODO
      itemBuilder: (final BuildContext context, final int index) {
        switch (index) {
          default:
            assert(false); // unreachable
            return null;
        }
      },
      separatorBuilder: (final BuildContext context, final int index) {
        return Divider();
      },
    );
  }

  Future<void> _initPlatformState() async {
    // TODO
  }
}
