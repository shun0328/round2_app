import 'package:flutter/material.dart';

class TournamentModel extends ChangeNotifier {
  //テスト
  String testText = "testします"; // テストコード

  // テストコード
  void testMethod(){
    testText = "test成功";
    print(testText);
    notifyListeners();
  }
}