import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TimeLineModel extends ChangeNotifier {
  //final Stream<QuerySnapshot> _tweetsSream =
  //FirebaseFirestore.instance.collection('users').snapshots();
  final _tweetCollection = FirebaseFirestore.instance.collection('tweets');

  // トーナメントオブジェクトのリスト
  List<Tweet>? tweets;

  void fetchTweet2(tweets) async {
    for (int i = 0; i < tweets.length; i++) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(tweets[0].userId)
          .get();
      tweets[i].userName = await snapshot['nickName'];
      print(snapshot['nickName']);
    }
  }

  // FireBaseからトーナメント情報を取得
  void fetchTweet() async {
    // データベースからデータを受け取る
    final snapshot = await _tweetCollection.get();
    // 受け取った情報からインスタンスを生成
    final List<Tweet> tweets = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String imageURL = data["imageURL"];
      final String text = data['text'];
      final String userId = data['userId'];
      final String userName = data['userName'];
      final String userImage = data['userImage'];

      print(data['user']);

      return Tweet(imageURL, text, userId, userName, userImage);
    }).toList();
    // ツイートオブジェクトのリストが完成
    this.tweets = tweets;

    // 終わった事をviewに知らせる
    notifyListeners();
  }

  // ドキュメントIDからユーザーの名前を取得する関数
  String getName(userId) {
    /*
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    print(snapshot['nickName']);

     */

    notifyListeners();

    return 'a';
  }

  // ドキュメントIDからユーザーの画像を取得する関数
  String getImage(userId) {
    return 'https://firebasestorage.googleapis.com/v0/b/round2-fb.appspot.com/o/profile.png?alt=media&token=29684e3b-9544-44b1-948f-2d2d0349f900';
  }
}

// tweet object
class Tweet {
  // constructor
  Tweet(this.imageURL, this.text, this.userId, this.userName, this.userImage);
  String imageURL;
  String text;
  String userId;
  String userName;
  String userImage;
}
