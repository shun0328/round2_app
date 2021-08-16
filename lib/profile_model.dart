import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {

  // ID
  final String id = 'asdfghjkl';
  // 名前
  final String name = 'REONA';
  // レート
  final int rating = 6000;
  // 来店回数
  final int visit_time = 6;
  // ポイント
  final point = 270;
  // チップ
  final chip = 15000;

  // メソッド
  void hogeMethod(){
    notifyListeners();
  }
}