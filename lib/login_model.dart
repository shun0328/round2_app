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

  // エラーメッセージを翻訳する関数
  String translateError(e) {
    String errorMessage = e;
    if (e ==
        '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
      errorMessage = '正しいパスワードを入力してください';
    }
    if (e ==
        '[firebase_auth/invalid-email] The email address is badly formatted.') {
      errorMessage = '正しいメールアドレスを入力してください';
    }
    if (e ==
        '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
      errorMessage = '登録されていないメールアドレスです';
    }
    if (e ==
        '[firebase_auth/too-many-requests] Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.') {
      errorMessage = 'アカウントがロックされています。時間をおいて試してください';
    }
    return errorMessage;
  }
}
