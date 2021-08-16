import 'package:flutter/material.dart';

class SettingModel extends ChangeNotifier {
  // メンバ変数
  String hoge = "hoge";

  // メソッド
  void hogeMethod(){
    notifyListeners();
  }
}