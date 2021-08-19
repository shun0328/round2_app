import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {

  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';
  String password2 = '';
  String name = '';
  String nickName = '';

  // メソッド
  void sampleMethod() {
    notifyListeners();
  }

  // メソッド
  Future addProfile() async{
    if(email == null || email == ""){
      throw 'メールアドレスが入力されていません';
    }
    notifyListeners();
  }
}
