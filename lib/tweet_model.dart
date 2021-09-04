import 'dart:io';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/*
テーブル[tweets]
string    imageURL
string    text
timestamp timeStamp
string    userID
string    userUID
*/

class TweetModel extends ChangeNotifier {
  // 画像ファイル
  File? imageFile;
  // テキスト
  String? text;
  // 名前
  String? userName;
  // プロフィール画像
  String? userImage;
  // ユーザID
  String? userId;

  // フォトギャラリーから画像を選ぶための関数
  Future showImagePicker() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    notifyListeners();
  }

  // ユーザーのIDを情報を受け取る関数
  Future getUserId() async {
    // ログイン中のメールアドレスと一致するuserを抽出
    final _userCollection = FirebaseFirestore.instance
        .collection('users')
        .where("email",
            isEqualTo: FirebaseAuth.instance.currentUser?.email ?? '');
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();
    final userId = snapshot.docs[0]['id'];
    return userId;
  }

  // ツイート内容をデータベースに保存
  // 入力した情報をデータベースに格納する関数
  Future addTweet() async {
    // 自分のIDを受け取る
    final userId = await getUserId();
    // 不備があったらエラーを返す
    if (this.text == null) {
      throw 'テキストが入力されていません';
    }
    // クラウド上の画像の場所(URL)が入る
    final imageURL;
    if (this.imageFile == null) {
      imageURL = '';
    } else {
      imageURL = await _uploadImage();
    }
    // tweetsテーブルにtweetを追加
    await FirebaseFirestore.instance.collection('tweets').add({
      'imageURL': imageURL,
      'text': this.text,
      'userId': userId,
      'userUID': FirebaseAuth.instance.currentUser!.uid,
      'timeStamp': DateTime.now(),
    });
  }

  // ランダムで10桁の文字列を作成する関数
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
    return alphabetArray.join('');
  }

  // firebaseストレージに画像を保存する
  Future<String> _uploadImage() async {
    final storage = FirebaseStorage.instance;
    // fileの名前を生成する(ランダムな10桁のアルファベット)
    final fileName = idGenerator();
    // 保存
    TaskSnapshot snapshot =
        await storage.ref().child("/$fileName").putFile(imageFile!);
    // クラウドのどこに画像があるかURLを受け取る
    final String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}
