import 'package:flutter/material.dart';

// 全ての背景色をここで設定
Color backGroundColor = Color.fromRGBO(102, 102, 102, 1.0);

class SettingModel extends ChangeNotifier {
  // メンバ変数
  String? sample;

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
