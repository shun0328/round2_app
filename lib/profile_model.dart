import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileModel extends ChangeNotifier {
  final _userCollection = FirebaseFirestore.instance.collection('users')
      .where("email", isEqualTo:FirebaseAuth.instance.currentUser!.email!);

  // リングゲームオブジェクトのリスト
  Profile? profiles;

  // ID
  String id = 'a';
  // 名前
  String _nickName = 'a';

  String get nickName => _nickName;
  // Setter
  set nickName(String s) {
      _nickName = s;
  }

  // レート
  int rating = 10;
  // 来店回数
  int visitTime = 10;
  // ポイント
  int point = 10;
  // チップ
  int chip = 10;

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

  // メソッド
  String getNickName() {
    fetchProfile();
    return this.nickName;
  }

  void fetchProfile() async {

    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();

    // 受け取った情報からインスタンスを生成
    final List<Profile> Profiles = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      id = data['id'];
      nickName = data['nickName'];
      rating = data['rating'];
      visitTime = data['visitTime'];
      point = data['point'];
      chip = data['chip'];
      return Profile(id, nickName, rating, visitTime, point, chip);
    }).toList();

    this.profiles = Profiles[0];

    // 終わった事をviewに知らせる
    notifyListeners();
  }
}

// Ring Game object
class Profile{
  // constructor
  Profile(this.id, this.nickName, this.rating, this.visitTime, this.point, this.chip);
  String id;
  String nickName;
  int rating;
  int visitTime;
  int point;
  int chip;
}
