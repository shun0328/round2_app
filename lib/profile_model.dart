import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModel extends ChangeNotifier {
  final _userCollection = FirebaseFirestore.instance
      .collection('users')
      .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email!);

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
  String imageURL =
      'https://static.retrip.jp/spot/e5c7b040-2956-4104-9fc6-db6f498e63d7/images/2c147da2-0684-4ebb-abf1-731a5ef8a9a8_l.jpg';

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

  late File imageFile;
  final ImagePicker _picker = ImagePicker();

  Future showImagePicker() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
  }

  // データベースからプロフィール情報を受け取る関数
  void fetchProfile() async {
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    // 受け取った情報からインスタンスを生成
    final List<Profile> profiles =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      id = data['id'];
      nickName = data['nickName'];
      rating = data['rating'];
      visitTime = data['visitTime'];
      point = data['point'];
      chip = data['chip'];
      return Profile(id, nickName, rating, visitTime, point, chip, imageURL);
    }).toList();

    this.profile = profiles[0];

    // 終わった事をviewに知らせる
    notifyListeners();
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
