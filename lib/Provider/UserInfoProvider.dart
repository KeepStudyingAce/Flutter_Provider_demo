import 'package:flutter/material.dart';

class UserInfoProvider with ChangeNotifier {
  String _name = "Jack";
  String get name => _name;

  void setName(String newName) {
    if (newName != _name) {
      print('🔥 用户名修改通知 👉 $newName');
      _name = newName;
      notifyListeners();
    }
  }
}
