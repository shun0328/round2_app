import 'package:flutter/material.dart';

class ProfileModel extends ChangeNotifier {
  // ID
  String id = 'sample123';
  // 名前
  String name = 'SAMPLE';
  // レート
  int rating = 2000;
  // 来店回数
  int visitTime = 1;
  // ポイント
  int point = 100;
  // チップ
  int chip = 1000;

  // プロフィール説明文
  final String sentence = 'レートの上がり方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
      'ポイントの使い方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
      'ポイントの使い方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
      'ポイントの使い方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n';

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
