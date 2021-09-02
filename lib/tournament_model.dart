import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/*
テーブル[tournaments]
number  buyIn
string  date
string  entry
string  lateRegistration
array   member
number  reBuy
number  stack
string  structure
string  tournamentName
*/

class TournamentModel extends ChangeNotifier {
  // トーナメントオブジェクトのリスト
  List<Tournament>? tournaments;

  // FireBaseからトーナメント情報を取得する関数
  void fetchTournament() async {
    // データベースからデータを受け取る
    final _tournamentCollection =
        FirebaseFirestore.instance.collection('tournaments');
    final snapshot = await _tournamentCollection.get();

    // 受け取った情報からインスタンスを生成
    final List<Tournament> tournaments =
        snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      final String id = document.id;
      final String tournamentName = data['tournamentName'];
      final String date = data['date'];
      final String entry = data['entry'];
      final String lateRegistration = data['lateRegistration'];
      final int buyIn = data['buyIn'];
      final int reBuy = data['reBuy'];
      final int stack = data['stack'];
      final String structure = data['structure'];
      final List member = data['member'];
      return Tournament(id, tournamentName, date, entry, lateRegistration,
          buyIn, reBuy, stack, structure, member);
    }).toList();

    // トーナメントオブジェクトのリストが完成
    this.tournaments = tournaments;

    // 終わった事をviewに知らせる
    notifyListeners();
  }

  // トーナメントをキャンセルするための関数
  void cancelTournament(tournament) async {
    // ログイン情報からメールアドレスを取得
    String mail = FirebaseAuth.instance.currentUser!.email!;
    // メンバー一覧（配列）を取得
    List member = tournament.member;
    // 配列の中に自分のアドレスが入っていたら削除
    for (var i = 0; i < member.length; i++) {
      if (member[i] == mail) {
        member.removeAt(i);
        i--;
      }
    }
    // 修正したメンバー一覧（配列）をデータベースに更新
    await FirebaseFirestore.instance
        .collection('tournaments')
        .doc(tournament.id)
        .update({
      'member': member,
    });
    // ローカルの情報も更新
    tournament.joined = false;
    notifyListeners();
  }

  // トーナメントに参加するための関数
  void joinTournament(tournament) async {
    // メンバーリスト(配列)に自分を追加
    List member = tournament.member;
    member.add(FirebaseAuth.instance.currentUser!.email!);
    // FireStoreのデータをアップデート
    await FirebaseFirestore.instance
        .collection('tournaments')
        .doc(tournament.id)
        .update({
      'member': member,
    });
    // ローカルの情報も更新
    tournament.joined = true;
    notifyListeners();
  }
}

// tournament object
class Tournament {
  // constructor
  Tournament(
      this.id,
      this.tournamentName,
      this.date,
      this.entry,
      this.lateRegistration,
      this.buyIn,
      this.reBuy,
      this.stack,
      this.structure,
      this.member);
  String id;
  String tournamentName;
  String date;
  String entry;
  String lateRegistration;
  int buyIn;
  int reBuy;
  int stack;
  String structure;
  List member;
  bool joined = false;

  // メンバー 一覧に自分のIDが入っていたらtrueを返す
  bool isJoined() {
    for (var i = 0; i < member.length; i++) {
      if (member[i] == FirebaseAuth.instance.currentUser!.email!) {
        return true;
      }
    }
    return false;
  }
}
