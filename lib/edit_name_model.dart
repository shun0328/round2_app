import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditNameModel extends ChangeNotifier {
  // usersテーブルの中からログイン中の
  // メールアドレスと一致するuserを抽出
  final _userCollection = FirebaseFirestore.instance.collection('users').where(
      "email",
      isEqualTo: FirebaseAuth.instance.currentUser?.email ?? '');

  // ドキュメントID
  String documentId = '';

  String? newName;

  // データベースからプロフィール情報を受け取る関数
  void fetchProfile() async {
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    // 受け取った情報からインスタンスを生成
    documentId = snapshot.docs[0].id;
    // 終わった事をviewに知らせる
    notifyListeners();
  }

  Future upDateName() async {
    if (newName == null) {
      throw ('名前が入力されていません');
    }
    final _userCollection =
        FirebaseFirestore.instance.collection('users').doc(documentId).update({
      'nickName': newName,
    });
    notifyListeners();
  }
}
