import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*
テーブル[users]
number  chip
string  email
string  id
string  imageURL
string  name
string  nickName
string  password
number  point
number  rating
number  visitTime
*/

class CreateUserModel extends ChangeNotifier {
  // 入力したメールアドレス
  String? email;
  // 入力したパスワード
  String? password;
  // 入力した確認用パスワード
  String? password2;
  // 入力したお名前
  String? name;
  // 入力したニックネーム
  String? nickName;
  // デフォルトアイコン
  String imageURL =
      'https://firebasestorage.googleapis.com/v0/b/round2-fb.appspot.com/o/profile.png?alt=media&token=29684e3b-9544-44b1-948f-2d2d0349f900';

  // ランダムで8桁のIDを作成する関数
  idGenerator() {
    var idArray = [];
    var rand = new math.Random();
    for (var i = 0; i < 8; i++) {
      idArray.add(rand.nextInt(10));
    }
    return idArray.join('');
  }

  // 入力した情報をデータベースに格納する関数
  Future addUser() async {
    // 不備があったらエラーを返す
    if (name == null) {
      throw 'お名前が入力されていません';
    }
    if (nickName == null) {
      throw 'ニックネームが入力されていません';
    }
    if (email == null) {
      throw 'メールアドレスが入力されていません';
    }
    if (password == null) {
      throw 'パスワードが入力されていません';
    }
    if (password != password2) {
      throw '確認用パスワードがパスワードと一致しません';
    }

    // メール/パスワードでユーザー登録
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    // usersテーブルにuserを追加
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

  // エラーメッセージを翻訳する関数
  String translateError(e) {
    String errorMessage = e;
    if (e ==
        '[firebase_auth/invalid-email] The email address is badly formatted.') {
      errorMessage = '正しいメールアドレスを入力してください';
    }
    if (e ==
        '[firebase_auth/email-already-in-use] The email address is already in use by another account.') {
      errorMessage = 'そのメールアドレスは既に使われています';
    }
    if (e ==
        '[firebase_auth/weak-password] Password should be at least 6 characters') {
      errorMessage = 'パスワードは6文字以上で設定してください';
    }
    return errorMessage;
  }
}
