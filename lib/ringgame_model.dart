import 'package:flutter/material.dart';

class RingGameModel extends ChangeNotifier {

  String tableName = 'A';
  final time = '19:30';
  final numMember = 6;

  final tableName02 = 'B';
  final time02 = '17:00';
  final numMember02 = 8;

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
