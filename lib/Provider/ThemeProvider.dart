import 'package:flutter/material.dart';

enum ThemeColorType {
  white,
  black,
}

class ThemeProvider with ChangeNotifier {
  ThemeColorType _themeColor = ThemeColorType.white;
  ThemeColorType get themeColor => _themeColor;

  void changeThemeColor(ThemeColorType newColor) {
    if (newColor != _themeColor) {
      print('🔥 主题色修改通知 👉 $newColor');
      _themeColor = newColor;
      notifyListeners();
    }
  }
}
