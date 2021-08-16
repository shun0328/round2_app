import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {

  // ID
  final String id = 'sample123';
  // 名前
  final String name = 'SAMPLE';
  // レート
  final int rating = 2000;
  // 来店回数
  final int visitTime = 1;
  // ポイント
  final point = 100;
  // チップ
  final chip = 1000;

  // メソッド
  void sampleMethod(){
    notifyListeners();
  }
}