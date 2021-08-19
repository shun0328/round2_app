import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {

  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';


  // Authenticationでログインを行う関数
  Future login() async{
    // メール・パスワードでログイン
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
