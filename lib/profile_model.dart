import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModel extends ChangeNotifier {
  // usersテーブルの中からログイン中の
  // メールアドレスと一致するuserを抽出
  final _userCollection = FirebaseFirestore.instance.collection('users').where(
      "email",
      isEqualTo: FirebaseAuth.instance.currentUser?.email ?? '');

  // ドキュメントID
  String documentId = '';
  // リングゲームオブジェクト
  Profile? profile;
  // ID
  String id = '';
  // 名前
  String nickName = '';
  // レート
  int rating = 0;
  // 来店回数
  int visitTime = 0;
  // ポイント
  int point = 0;
  // チップ
  int chip = 0;
  // プロフィール画像
  String imageURL = '';
  // プロフィール画像(変更時に使用)
  late File imageFile;

  Image? hoge;

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

  // フォトギャラリーから画像を選ぶための関数
  Future showImagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    notifyListeners();
  }

  // データベースからプロフィール情報を受け取る関数
  void fetchProfile() async {
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    // 受け取った情報からインスタンスを生成
    final List<Profile> profiles =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      documentId = document.id;
      id = data['id'];
      nickName = data['nickName'];
      rating = data['rating'];
      visitTime = data['visitTime'];
      point = data['point'];
      chip = data['chip'];
      imageURL = data['imageURL'];
      return Profile(id, nickName, rating, visitTime, point, chip, imageURL);
    }).toList();

    this.profile = profiles[0];

    // 終わった事をviewに知らせる
    notifyListeners();
  }

  // usersテーブルの画像のurlを更新
  void updateURL() async {
    final imageURL = await _uploadImage();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(documentId)
        .update({
      'imageURL': imageURL,
    });
    print('3');
    notifyListeners();
  }

  // firebaseストレージに画像を保存する(ファイル名はID)
  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;

    TaskSnapshot snapshot =
        await storage.ref().child("/$id").putFile(imageFile);

    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

// Ring Game object
class Profile {
  // constructor
  Profile(this.id, this.nickName, this.rating, this.visitTime, this.point,
      this.chip, this.imageURL);
  String id;
  String nickName;
  int rating;
  int visitTime;
  int point;
  int chip;
  String imageURL;
}
