import 'package:day_one/widgets/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeDataStyle = ThemeDataStyle.light;

  ThemeData get themeDataStyle => _themeDataStyle;

  set themeDataStyle (ThemeData themeData) {
    _themeDataStyle = themeData;
    notifyListeners();
  }

  void changeTheme() {
    if (_themeDataStyle == ThemeDataStyle.light) {
      _themeDataStyle = ThemeDataStyle.dark;
      print('change to dark');
    } else {
      _themeDataStyle = ThemeDataStyle.light;
      print('change to light');
    }
  }
}