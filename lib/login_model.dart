import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  // 入力したメールアドレス
  String email = '';
  // 入力したパスワード
  String password = '';

  // ログインを行う関数(Authentication)
  Future login() async {
    // メール・パスワードでログイン
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    notifyListeners();
  }
}
