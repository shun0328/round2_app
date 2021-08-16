import 'package:flutter/material.dart';

class RingGameModel extends ChangeNotifier {
  // メンバ変数
  String hoge = "hoge";

  // メソッド
  void hogeMethod(){
    notifyListeners();
  }
}