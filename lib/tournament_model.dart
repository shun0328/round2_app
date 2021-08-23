import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_model.dart';

class TournamentModel extends ChangeNotifier {
  final _tournamentCollection =
      FirebaseFirestore.instance.collection('tournaments');

  // トーナメントオブジェクトのリスト
  List<Tournament>? tournaments;

  ProfileModel profile = ProfileModel();

  // FireBaseからトーナメント情報を取得
  void fetchTournament() async {
    // データベースからデータを受け取る
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
      final int numMember = data['numMember'];
      final List member = data['member'];
      return Tournament(id, tournamentName, date, entry, lateRegistration,
          buyIn, reBuy, stack, structure, numMember, member);
    }).toList();

    // トーナメントオブジェクトのリストが完成
    this.tournaments = tournaments;

    // 終わった事をviewに知らせる
    notifyListeners();
  }

  void fetchProfile() {
    profile.fetchProfile();
  }

  void cancelTournament(tournament) async {
    String mail = await FirebaseAuth.instance.currentUser!.email!;
    List member = tournament.member;

    for (var i = 0; i < member.length; i++) {
      if (member[i] == mail) {
        member.removeAt(i);
        i--;
      }
    }
    await FirebaseFirestore.instance
        .collection('tournaments')
        .doc(tournament.id)
        .update({
      'member': member,
    });
  }

  void joinTournament(tournament) async {
    List member = tournament.member;
    member.add(FirebaseAuth.instance.currentUser!.email!);
    //print(member);
    //print(tournament.id);
    // FireStoreに追加
    await FirebaseFirestore.instance
        .collection('tournaments')
        .doc(tournament.id)
        .update({
      'member': member,
    });
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
      this.numMember,
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
  int numMember;
  List member;
  bool joined = false;

  bool isJoined() {
    // メンバー 一覧に自分のIDが入っていたらtrueを返す
    for (var i = 0; i < member.length; i++) {
      if (member[i] == FirebaseAuth.instance.currentUser!.email!) {
        return true;
      }
    }
    return false;
  }
}
