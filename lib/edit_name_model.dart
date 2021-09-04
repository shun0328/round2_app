import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditNameModel extends ChangeNotifier {
  // ドキュメントID
  String? documentId;
  // 入力された名前
  String? newName;

  // データベースからドキュメントIDを受け取る関数
  void getDocId() async {
    // usersテーブルの中からログイン中の
    // メールアドレスと一致するuserを抽出
    final _userCollection = FirebaseFirestore.instance
        .collection('users')
        .where("email",
            isEqualTo: FirebaseAuth.instance.currentUser?.email ?? '');
    // データベースからdocumentIDを受け取る
    final snapshot = await _userCollection.get();
    this.documentId = snapshot.docs[0].id;
    // 終わった事をviewに知らせる
    notifyListeners();
  }

  // データベースの名前を更新する関数
  Future upDateName() async {
    // 不備があったらエラーを返す
    if (newName == null) {
      throw ('名前が入力されていません');
    }
    // データベースの名前を更新
    FirebaseFirestore.instance.collection('users').doc(documentId).update({
      'nickName': newName,
    });
    notifyListeners();
  }
}
