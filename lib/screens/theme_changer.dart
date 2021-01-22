import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  // ignore: always_declare_return_types
  getTheme() => _themeData;
  // ignore: always_declare_return_types
  setTheme(ThemeData theme) {
    _themeData = theme;

    notifyListeners();
  }
}
