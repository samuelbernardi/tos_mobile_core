import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class BaseBloc extends ChangeNotifier {
  BuildContext context;
  bool busy = false;
  bool err = false;
  dynamic errMessage;
  LocalStorage storage;

  BaseBloc() {
    storage = LocalStorage('checklist_storage');
  }
}
