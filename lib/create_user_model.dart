import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateUserModel extends ChangeNotifier {
  // 入力したメールアドレス
  String email = '';
  // 入力したパスワード
  String password = '';
  // 入力した確認用パスワード
  String password2 = '';
  // 入力したお名前
  String name = '';
  // 入力したニックネーム
  String nickName = '';

  String imageURL =
      'https://firebasestorage.googleapis.com/v0/b/round2-fb.appspot.com/o/profile.png?alt=media&token=29684e3b-9544-44b1-948f-2d2d0349f900';

  // ランダムで6桁の文字列を作成する関数(衝突確率 1/308915776)
  // 戻り値の例： fgdidn, aktbxo
  idGenerator() {
    int smallLetterStart = 97;
    int smallLetterCount = 26;
    var alphabetArray = [];
    var rand = new math.Random();
    for (var i = 0; i < 8; i++) {
      int number = rand.nextInt(smallLetterCount);
      int randomNumber = number + smallLetterStart;
      alphabetArray.add(String.fromCharCode(randomNumber));
    }
    return alphabetArray.join('');
  }

  // 入力した情報をデータベースに格納する関数
  Future addUser() async {
    // 不備があったらエラーを返す
    if (name == '') {
      throw 'お名前が入力されていません';
    }
    if (nickName == '') {
      throw 'ニックネームが入力されていません';
    }
    if (email == '') {
      throw 'メールアドレスが入力されていません';
    }
    if (password == '') {
      throw 'パスワードが入力されていません';
    }
    if (password != password2) {
      throw '確認用パスワードがパスワードと一致しません';
    }

    // メール/パスワードでユーザー登録
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // FireStoreに追加
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'nickName': nickName,
      'email': email,
      'password': password,
      'visitTime': 0,
      'point': 0,
      'chip': 0,
      'rating': 0,
      'id': idGenerator(),
      'imageURL': imageURL,
    });

    notifyListeners();
  }
}
