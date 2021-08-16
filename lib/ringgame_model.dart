import 'package:flutter/material.dart';

class RingGameModel extends ChangeNotifier {

  final table_name = 'A';
  final time = '19:30';
  final num_member = 6;

  final table_name02 = 'B';
  final time02 = '17:00';
  final num_member02 = 8;

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }
}
