import 'dart:io';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TweetModel extends ChangeNotifier {
  // 画像ファイル
  File? imageFile;
  // テキスト
  String? text;
  // 名前
  String? userName;

  String? userImage;

  // フォトギャラリーから画像を選ぶための関数
  Future showImagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    print(imageFile);
    notifyListeners();
  }

  Future getName() async {
    // メールアドレスと一致するuserを抽出
    final _userCollection = FirebaseFirestore.instance
        .collection('users')
        .where("email",
            isEqualTo: FirebaseAuth.instance.currentUser?.email ?? '');

    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    final List<UserData> users = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      userName = data['nickName'];
      userImage = data['imageURL'];
      return UserData(userName!, userImage!);
    }).toList();

    return [userName, userImage];
  }

  // ツイート内容をデータベースに保存
// 入力した情報をデータベースに格納する関数
  Future addTweet() async {
    final userinfo = await getName();

    // 不備があったらエラーを返す
    if (text == null) {
      throw 'テキストが入力されていません';
    }
    final imageURL;

    if (imageFile == null) {
      imageURL = '';
    } else {
      imageURL = await _uploadImage();
    }

    // tweetsテーブルにtweetを追加
    await FirebaseFirestore.instance.collection('tweets').add({
      'imageURL': imageURL,
      'text': text,
      'userImage': userinfo[1],
      'userName': userinfo[0],
    });

    notifyListeners();
  }

  // ランダムで10桁の文字列を作成する関数
  // 戻り値の例： fgdidgtn, aktbgtxo
  idGenerator() {
    int smallLetterStart = 97;
    int smallLetterCount = 26;
    var alphabetArray = [];
    var rand = new math.Random();
    for (var i = 0; i < 10; i++) {
      int number = rand.nextInt(smallLetterCount);
      int randomNumber = number + smallLetterStart;
      alphabetArray.add(String.fromCharCode(randomNumber));
    }
    print(alphabetArray.join(''));
    return alphabetArray.join('');
  }

  // firebaseストレージに画像を保存する(ファイル名はID)
  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;

    final fileName = idGenerator();

    TaskSnapshot snapshot =
        await storage.ref().child("/$fileName").putFile(imageFile!);

    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

// tweet object
class Tweet {
  // constructor
  Tweet(this.imageURL, this.text, this.userName, this.userImage);
  String imageURL;
  String text;
  String userName;
  String userImage;
}

class UserData {
  // constructor
  UserData(this.name, this.imageURL);
  String name;
  String imageURL;
}
