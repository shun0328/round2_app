import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditImageModel extends ChangeNotifier {
  // プロフィール画像
  String? imageURL;
  // プロフィール画像(変更時に使用)
  late File imageFile;
  // ドキュメントID
  String? documentId;
  // userID
  String? id;

  // データベースからプロフィール情報を受け取る関数
  void getUserInfo() async {
    // usersテーブルの中からログイン中の
    // メールアドレスと一致するuserを抽出
    final _userCollection = FirebaseFirestore.instance
        .collection('users')
        .where("email",
            isEqualTo: FirebaseAuth.instance.currentUser?.email ?? '');
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    this.documentId = snapshot.docs[0].id;
    this.id = snapshot.docs[0]['id'];
    this.imageURL = snapshot.docs[0]['imageURL'];

    // 終わった事をviewに知らせる
    notifyListeners();
  }

  // フォトギャラリーから画像を選ぶための関数
  Future showImagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    notifyListeners();
  }

  // usersテーブルの画像のurlを更新
  void updateURL() async {
    final imageURL = await _uploadImage();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(this.documentId)
        .update({
      'imageURL': imageURL,
    });
    notifyListeners();
  }

  // firebaseストレージに画像を保存する(ファイル名はID)
  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;
    TaskSnapshot snapshot =
        await storage.ref().child("/$id").putFile(imageFile);
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    this.imageURL = downloadUrl;
    return downloadUrl;
  }
}
