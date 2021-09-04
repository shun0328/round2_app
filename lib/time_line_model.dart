import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/*
テーブル[tweets]
string    imageURL
string    text
timestamp timeStamp
string    userID
string    userUID
*/

class TimeLineModel extends ChangeNotifier {
  // ツイートオブジェクトのリスト
  List<Tweet>? tweets;

  // ユーザ名とプロフィール画像を
  // 投稿の分だけ取得するため
  // 取得したら＋１
  int count = 0;

  // FireBaseからトーナメント情報を取得
  void fetchTweet() async {
    // データベースからデータを受け取る
    final _tweetCollection = FirebaseFirestore.instance
        .collection('tweets')
        .orderBy('timeStamp', descending: true);
    final snapshot = await _tweetCollection.get();
    // 受け取った情報からインスタンスを生成
    final List<Tweet> tweets = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String imageURL = data["imageURL"];
      final String text = data['text'];
      final String userUID = data['userUID'];
      final String userName = '';
      final String userImage =
          'https://firebasestorage.googleapis.com/v0/b/round2-fb.appspot.com/o/profile.png?alt=media&token=29684e3b-9544-44b1-948f-2d2d0349f900';
      final String userId = data['userId'];
      final String docId = document.id;
      return Tweet(imageURL, text, userName, userImage, docId, userUID, userId);
    }).toList();
    // ツイートオブジェクトのリストが完成
    this.tweets = tweets;
    // 終わった事をviewに知らせる
    notifyListeners();
  }

  // ツイートを削除する関数
  deleteTweet(docId) async {
    // データベースのツイート情報を削除
    FirebaseFirestore.instance.collection('tweets').doc(docId).delete();
    // ローカルにあるツイート情報も削除
    for (var i = 0; i < tweets!.length; i++) {
      if (tweets![i].docId == docId) {
        tweets!.removeAt(i);
        break;
      }
    }
    notifyListeners();
  }

  // プロフィール画像とユーザ名を取得する関数
  Future getUserInfo(i) async {
    // usersテーブルの中からログイン中の
    // メールアドレスと一致するuserを抽出
    final _userCollection = FirebaseFirestore.instance
        .collection('users')
        .where("id", isEqualTo: tweets![i].userId);
    // データベースからデータを受け取る
    final snapshot = await _userCollection.get();

    // 受け取った情報を格納
    this.tweets![i].userId = snapshot.docs[0]['nickName'];
    this.tweets![i].userImage = snapshot.docs[0]['imageURL'];

    this.count += 1;
    // 終わった事をviewに知らせる
    notifyListeners();
  }
}

// tweet object
class Tweet {
  // constructor
  Tweet(this.imageURL, this.text, this.userName, this.userImage, this.docId,
      this.userUID, this.userId);
  String imageURL;
  String text;
  String userName;
  String userImage;
  String docId;
  String userUID;
  String userId;
}
