import 'package:flutter/material.dart';

class TournamentModel extends ChangeNotifier {
  // メンバ変数
  String hoge = "hoge";

  // メソッド
  void hogeMethod(){
    notifyListeners();
  }
}