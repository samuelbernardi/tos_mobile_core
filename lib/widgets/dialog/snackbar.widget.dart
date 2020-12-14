import 'package:flutter/material.dart';

class SnackbarWidget {
  BuildContext context;
  Widget content;

  SnackbarWidget({this.context, this.content});

  void show() {
    Scaffold.of(context).showSnackBar(SnackBar(content: content));
  }
}
