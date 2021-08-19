import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class CreateUserModel extends ChangeNotifier {

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

  // ランダムで6桁の文字列を作成
  // 衝突確率 1/308915776
  idGenerator() {
    // 小文字のアルファベットの文字列を作成
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

  // メソッド
  Future addUser() async{

    // 不備があったらエラーを返す
    if(name == ''){
      throw 'お名前が入力されていません';
    }
    if(nickName == ''){
      throw 'ニックネームが入力されていません';
    }
    if(email == ''){
      throw 'メールアドレスが入力されていません';
    }
    if(password == ''){
      throw 'パスワードが入力されていません';
    }
    if(password != password2){
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
      //'id':FirebaseAuth.instance.currentUser!.uid,
      'id':idGenerator(),

    });

    notifyListeners();
  }
}
