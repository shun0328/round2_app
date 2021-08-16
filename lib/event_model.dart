import 'package:flutter/material.dart';

class EventModel extends ChangeNotifier {
  //テスト
  String testText = "testします"; // テストコード

  // テストコード
  void testMethod(){
    print(testText);
    testText = "test成功";
    notifyListeners();
  }
}