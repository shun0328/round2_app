import 'package:flutter/material.dart';

class SettingModel extends ChangeNotifier {
  // メンバ変数
  String sample = "sample";


  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
