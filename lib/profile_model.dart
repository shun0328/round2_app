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

class ProfileModel extends ChangeNotifier {
  // ドキュメントID
  String? documentId;
  // ID
  String? id;
  // 名前
  String? nickName;
  // レート
  int? rating;
  // 来店回数
  int? visitTime;
  // ポイント
  int? point;
  // チップ
  int? chip;
  // プロフィール画像
  String? imageURL;

  // プロフィール説明文
  final String sentence = 'レートの上がり方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
      'ポイントの使い方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
      'ポイントの使い方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n'
      'ポイントの使い方 \n'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜'
      '〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜\n\n\n';

  // プロフィール画面を構成する全てのデータがDBから取得できたらtrueを返す
  bool isDownloadCompleted() {
    if (this.documentId == null &&
        this.id == null &&
        this.nickName == null &&
        this.rating == null &&
        this.visitTime == null &&
        this.point == null &&
        this.chip == null &&
        this.imageURL == null) {
      return false;
    }
    return true;
  }

  // データベースからプロフィール情報を受け取る関数
  void fetchProfile() async {
    // usersテーブルの中からログイン中の
    // メールアドレスと一致するuserを抽出
    final _userCollection = FirebaseFirestore.instance
        .collection('users')
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email);
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    this.documentId = snapshot.docs[0].id;
    this.id = snapshot.docs[0]['id'];
    this.nickName = snapshot.docs[0]['nickName'];
    this.rating = snapshot.docs[0]['rating'];
    this.visitTime = snapshot.docs[0]['visitTime'];
    this.point = snapshot.docs[0]['point'];
    this.chip = snapshot.docs[0]['chip'];
    this.imageURL = snapshot.docs[0]['imageURL'];

    // 終わった事をviewに知らせる
    notifyListeners();
  }
}
