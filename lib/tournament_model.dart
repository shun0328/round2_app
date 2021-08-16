import 'package:flutter/material.dart';

class TournamentModel extends ChangeNotifier {
  // メンバ変数
  String sample = "sample";

  // メソッド
  void sampleMethod(){
    notifyListeners();
  }
}