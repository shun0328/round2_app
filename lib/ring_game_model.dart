import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RingGameModel extends ChangeNotifier {
  final _ringGameCollection = FirebaseFirestore.instance.collection('ringGames').orderBy('tableName');

  // リングゲームオブジェクトのリスト
  List<RingGame>? ringGames;

  // FireBaseからリングゲーム情報を取得
  void fetchRingGame() async {

    // データベースからデータを受け取る
    final snapshot = await _ringGameCollection.get();
    


    // 受け取った情報からインスタンスを生成
    final List<RingGame> ringGames = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String time = data['time'];
      final String ringGameName = data['tableName'];
      final int numMember = data['numMember'];
      return RingGame(ringGameName, numMember, time);
    }).toList();

    // トーナメントオブジェクトのリストが完成
    this.ringGames = ringGames;

    // 終わった事をviewに知らせる
    notifyListeners();
  }
}


// Ring Game object
class RingGame{
  // constructor
  RingGame(this.tableName, this.numMember, this.time);
  String tableName;
  int numMember;
  String time;
}