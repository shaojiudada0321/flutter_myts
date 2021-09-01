import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver{
  static CustomNavigatorObserver _instance = CustomNavigatorObserver();

  static CustomNavigatorObserver getInstance() {
    if (_instance == null) {
      _instance = CustomNavigatorObserver();
    }
    return _instance;
  }
}
