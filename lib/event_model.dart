import 'package:flutter/material.dart';

class EventModel extends ChangeNotifier {
  // メンバ変数
  String hoge = "hoge";

  // メソッド
  void hogeMethod(){
    notifyListeners();
  }
}