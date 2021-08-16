import 'package:flutter/material.dart';

class SettingModel extends ChangeNotifier {
  //テスト
  String testText = "testします"; // テストコード

  // テストコード
  void testMethod(){
    testText = "test成功";
    print(testText);
    notifyListeners();
  }
}